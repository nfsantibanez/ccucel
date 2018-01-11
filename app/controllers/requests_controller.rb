class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  layout 'general_view', except: [:create_user]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Functions for validate data
  def validate_user
    #Validate rut and form
    user = rut_verification(params[:user_rut])
    form = params[:request_type]
    # Redirect to correct form
    if user != 0 and user != -1
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
        session[:user]["item"] = "smartphone"
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

    elsif user == 0
      render json: {message: 'El usuario con Identificador nacional: '+params[:user_rut].to_s+ 'No se encuentra en la Base de datos de CCU'}
    else
      render json: {message: 'No se puede conectar a la Base de datos de CCU, intente mas tarde'}

    end
  end

  # Function to create Request by User Request
  def create_user

    if params["request"] == "transfer line"
      @request = Request.new(transfer_line_params)

    elsif params["request"] == "new" && params["items"] == "smartphone"
      @request = Request.new(new_sp_params)
    end

    # Si se graba exitosamente guardar el id en params
    params[:request_id] = rand(1000000..9999999)
    render layout: 'success'

    #if @request.save
      # Mandar Correo a supervisor
      # Render de mensaje de exito, numero de solicitud y volver a Home
      #puts(@request)
    #else
      # Render mensaje de error y volver a Solicitudes
      #puts(@request.errors)
    #end


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
    @renew_date = renew_date(@user["national_id"], @user["item"])
    # get user items
    @items = get_items(@user["national_id"])
  end

  # Renew Request form
  def transfer_line
    # User information in Hash
    @user = session[:user]
  end

  # Renew Request form
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
    # Check the due date to renew the item
    @renew_date = renew_date(@user["national_id"], @user["item"])
    # get user items
    @items = get_items(@user["national_id"])
  end

  # Renew Request form
  def technical_service
    # User information in Hash
    @user = session[:user]
    # get user item_wrapper_class
    @items = get_items(@user["national_id"])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.permit(:request, :item, :model, :plan, :contract, :file, :status,
        :comment, :comment_stolen_lost, :email_sended, :want_replacement,
        :want_sim, :phone_number, :transfer_line_type, :price, :closed_at, :user_id)
    end

    def transfer_line_params
      params.permit(:request, :item, :contract, :file, :status, :email_sended,
        :phone_number, :transfer_line_type, :closed_at, :user_id)
    end

    def new_sp_params
      params.permit(:request, :item, :model, :contract, :file, :status, :comment,
        :email_sended, :want_sim, :phone_number, :closed_at, :user_id)
    end
end
