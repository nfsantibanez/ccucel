class RequestsController < ApplicationController
  require 'securerandom'

  layout 'general_view', only: [:new_form, :renew_form, :transfer_line]
  before_action :set_request, only: [:show, :edit, :update, :update_validation]
  # Filter to protect page with login and session
  before_action :authenticate_user, only:  [:index, :edit, :update]
  # check session timer
  before_action :session_expiry, only:  [:index, :edit, :update]

  def index
    @search = Request.search(params[:q])
    @requests = @search.result
    render layout: 'admin_view'
  end

  def show
    if (@request && params.has_key?(:user_rut) && params[:user_rut] == @request.national_id) ||
      (@request && !params.has_key?(:user_rut))
      if params.has_key?(:request) && params[:request] == 'follow'
       render 'show', layout: 'admin_restrict_view'
      else
        # Just admins can access this
        authenticate_user
        # render
        render 'show', layout: 'admin_view'
      end
    else
      redirect_to '/requests/home/follow_request', alert: 'El n° de Solicitud no corresponde al usuario ingresado'
    end
  end

  # GET /requests/1/edit
  def edit
    render layout: 'admin_view'
  end

  # PATCH/PUT /requests/1
  def update
    # If contract is updated
    if params[:contract]
      params[:contract_type] = params[:contract].content_type
      params[:contract_name] = params[:contract].original_filename
      params[:contract] = params[:contract].read
    end

    # update classification if status change
    if params[:status] == 'cancelada' ||  params[:status] == 'finalizada'
      params[:classification] = 'cerrado'
      params[:closed_at] = DateTime.now
    end

    if @request.update(request_params_update)
      render 'show', layout: 'admin_view'
    else
      render layout: 'error'
    end
  end

  # PATCH/PUT /requests/1
  def update_validation

    # set approval for request
    if params[:commit] == "Aprobar"
      params[:sup_approval] = 'aprobada'
      params[:classification] = 'abierto'
      params[:status] = 'pendiente nota de pedido'

    elsif  params[:commit] == "Rechazar"
      params[:sup_approval] = 'rechazada'
      params[:status] = 'rechazada'
      params[:classification] = 'cerrado'
      params[:closed_at] = DateTime.now
    end

    # update request
    if @request.update(validate_params)

################################################################################
      begin
        # get user
          user = User.find_by_national_id(@request.national_id)
        # Approved
        if params[:commit] == "Aprobar"
          # Send email to user
          UserMailer.change_email(user, @request, 'Aprobada').deliver_now
          # Send email to admin when is approved
          UserMailer.admin_email(@request).deliver_now

        # rejected
        elsif params[:commit] == "Rechazar"
          # Send email to user
          UserMailer.change_email(user, @request, 'Rechazada').deliver_now
        end
      rescue
        render layout: 'error' and return
      end
################################################################################

      params[:request] = 'follow'
      render 'show', layout: 'admin_restrict_view'
    else
      render layout: 'error'
    end

  end

  def validations
    # find request
    @request = Request.find_by_link(params[:id])
    # if request was validated
    if !@request
      render json: {message: 'no se encontro solicitud'}
    else
      render 'validations', layout: 'admin_restrict_view'
    end
  end

    # Functions for validate data
  def validate_user
    #Validate rut and form
    user = rut_verification(params[:user_rut])
    form = params[:request_type]
    # Redirect to correct form
    if user != 0 and user != -1
      if user
        # User data
        session[:user] = user.attributes
        # selected request and item data
        session[:user]["request"] = params[:request_type]

        if params[:request_type] == 'renew' || params[:request_type] == 'technical service'
          session[:user]["item"] = params[:request_hw_renew_tech]
        elsif params[:request_type] == 'new'
          session[:user]["item"] = params[:request_hw_new]
        elsif params[:request_type] == 'stolen/lost'
          session[:user]["item"] = params[:request_hw_lost]
        else
          session[:user]["item"] = "smartphone line"
        end

        # Transfer Line
        if form == 'transfer line'
          redirect_to '/requests/forms/transferline'
        # New Request
        elsif form == 'new'
          redirect_to '/requests/forms/new'
        # Renew Request
        elsif form == 'renew'
          # check if selected item is owned by user
          # item = item_verification(params[:request_hw])
          redirect_to '/requests/forms/renew'
        # Stolen or Lost
        elsif form == 'stolen/lost'
          redirect_to '/requests/forms/stolenlost'
        # Technical service
        elsif form == 'technical service'
          redirect_to '/requests/forms/technicalservice'
        end

      else
        redirect_to '/requests/home/menu', alert: 'El usuario con Identificador nacional: '+params[:user_rut].to_s+ ' No se encuentra en la Base de datos de CCU'
      end

    elsif user == 0
      redirect_to '/requests/home/menu', alert: 'El usuario con Identificador nacional: '+params[:user_rut].to_s+ ' No se encuentra en la Base de datos de CCU'
    else
      redirect_to '/requests/home/menu', alert: 'No se puede conectar a la Base de datos de CCU, intente mas tarde'

    end
  end

  # Function to create Request by User Request
  def create_user

    # Create message to resume Request
    ms = build_message
    # add message to params
    params[:email_sended] = ms

    # Classify by request type to process params
    # Transfer line
    if params["request"] == "transfer line"

      # Modify request type (transfer line or release line)
      if params["transfer_line_type"] == "liberar"
        params["request"] = "release line"
      end
      # Create Request
      @request = Request.new(request_params)

    # Item Smartphone
    elsif params["item"] == "smartphone"

      if params["request"] != "technical service"
        # Get smartphone models's price
        params["price"] = params["model"]["price"]
        # Get smartphone models's name
        params["model"] = params["model"]["model"]
      end

      # Stolen/lost case
      if params["request"] == "stolen/lost"
        # Set file information
        params[:file_type] = params[:file].content_type
        params[:file_name] = params[:file].original_filename
        params[:file] = params[:file].read
      end
      # Create Request
      @request = Request.new(request_params)

    # Item Bam
    elsif  params["item"] == "bam"
      if params["request"] == "new" || params["request"] == "stolen/lost"
        # Get bam model's name
        params["model"] = params["model"].model
        # Get bam plan's price
        params["price"] = params["plan"].price
        # Get bam plan's name
        params["plan"] = params["plan"].name

        if params["request"] == "stolen/lost"
          # Set file information
          params[:file_type] = params[:file].content_type
          params[:file_name] = params[:file].original_filename
          params[:file] = params[:file].read
        end

      elsif params["request"] == "renew"
        # Get bam models's price
        params["price"] = params["model"].price
        # Get bam model's name
        params["model"] = params["model"].model
        begin
          # Get bam plan's name
          params["plan"] = params["plan"].name
        rescue NoMethodError
          # Get bam plan's name
          params["plan"] = params["plan"]["name"]
        end

      end
      # Create Request
      @request = Request.new(request_params)

    # Item Sim
    elsif params["item"] == "sim"
      # Set want_sim to true
      params["want_sim"] = true

      if params["request"] == "stolen/lost"
        # Set want_new_number to false
        params["want_new_number"] = false
        # Set number_type to same
        params["number_type"] = "same"
        # Set file information
        params[:file_type] = params[:file].content_type
        params[:file_name] = params[:file].original_filename
        params[:file] = params[:file].read
      end
      # Create Request
      @request = Request.new(request_params)

    # New Roaming
    elsif params["request"] == "new" && params["item"] == "roaming"
      # Get Roaming plan's price
      params["price"] = params["plan"].price
      # Get Roaming plan's name
      params["plan"] = params["plan"].name
      # Create Request
      @request = Request.new(request_params)
    end

    # If request was successfully created
    if @request.save

      # Crear n_request 6 digit hex alphanumberic
      # id = @request.id.to_s+SecureRandom.hex(3)

      # Crear n_request 6 digit number only
      id = @request.id.to_s+((SecureRandom.random_number(9e3) + 1e3).to_i).to_s
      params[:n_request] = id
      # Update Attributte
      @request.update_attribute("n_request", id)

      # Unique identifier to access request
      salt =  Digest::SHA256.hexdigest @request.national_id
      url = Digest::SHA256.hexdigest salt+@request.n_request
      params[:link] = url
      # Update Attributte
      @request.update_attribute("link", url)

      # Send mails
      user = User.find_by_id(params[:user_id])

################################################################################
      begin
        # Send mail to user
        UserMailer.user_email(user, @request).deliver_now
        puts('**********mandando emails**********')
        # Send mail to supervisor
        UserMailer.supervisor_email(user, @request).deliver_now
      rescue
        render layout: 'error' and return
      end
################################################################################

      puts(requests_url+"/validations/"+@request.link)

      # Render success message
      render layout: 'success'
    else
      # Render mensaje de error y volver a Home
      params[:errors]= @request.errors.to_json
      render layout: 'error'
    end


  end

  # Option to download the file
  def download_file
    @request = Request.find_by_n_request(params[:id])
    send_data(@request.file, type: @request.file_type, filename: @request.file_name,
      disposition: 'attachment')
  end

  # Option to download contract
  def download_contract
    @request = Request.find_by_n_request(params[:id])
    send_data(@request.contract, type: @request.contract_type, filename: @request.contract_name,
      disposition: 'attachment')
  end

  # New Request form
  def new_form
    # User information in Hash
    @user = session[:user]
    # Smartphones Models available
    @all_smartphones = available_smartphones_all(@user["country"])
    @cat_smartphones = available_smartphones_category(@user["country"], @user["job_family"])
    # Bam Models available
    @bams =  available_bams(@user["country"])
    # Bams Plans available
    @bam_plans = plans_available_bam(@user["country"])
    # Roaming plans
    @roaming_plans = roaming_plans(@user["country"])
    # Roaming bags
    @roaming_bags = roaming_bags(@user["country"])
    # get user items
    @items = get_items(@user["national_id"])
  end

  # Renew Request form
  def renew_form
    # User information in Hash
    @user = session[:user]
    # Smartphones Models available
    @all_smartphones = available_smartphones_all(@user["country"])
    @cat_smartphones = available_smartphones_category(@user["country"], @user["job_family"])
    # Bam Models available
    @bams = available_bams(@user["country"])
    # Check the due date to renew the item
    @renew_date = renew_date(@user)
    # get user items
    @items = get_items(@user["national_id"])
  end

  # Transferline Request form
  def transfer_line
    # User information in Hash
    @user = session[:user]
  end

  # stolen_lost Request form
  def stolen_lost
    # User information in Hash
    @user = session[:user]
    # Smartphones Models available
    @all_smartphones = available_smartphones_all(@user["country"])
    @cat_smartphones = available_smartphones_category(@user["country"], @user["job_family"])
    # Bam Models available
    @bams =  available_bams(@user["country"])
    # Bams Plans available
    @bam_plans = plans_available_bam(@user["country"])
    # get user items
    @items = get_items(@user["national_id"])

    render layout: 'general_view2'
  end

  # tech_service Request form
  def technical_service
    # User information in Hash
    @user = session[:user]
    # get user item_wrapper_class
    @items = get_items(@user["national_id"])

    render layout: 'general_view2'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find_by_link(params[:id])
      if !@request and params.has_key?(:n_request)
        params[:n_request].strip!
        @request = Request.find_by_n_request(params[:n_request])
      end
    rescue ActiveRecord::RecordNotFound
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.permit(:request, :item, :model, :plan, :classification,
        :contract, :contract_type, :contract_name, :file, :file_type, :file_name,
        :status, :comment, :comment_stolen_lost, :email_sended, :want_replacement,
        :want_sim, :want_new_number, :number_type, :phone_number, :transfer_line_type,
        :price, :region, :country, :name, :national_id, :email, :company, :deptname,
        :start_date, :end_date, :closed_at, :user_id, :link)
    end

    # params for update
    def request_params_update
      params.permit(:classification, :contract, :contract_type, :contract_name,
        :status, :price, :closed_at)
    end

    # params for update
    def validate_params
      params.permit(:sup_approval, :comment_sup, :classification, :status, :closed_at)
    end
end
