class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  layout 'general_view', :except => [:index]

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
    puts(params)
    puts(params)
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
    if user != 0
      # User data
      session[:user] = user.attributes
      # selected request and item data
      session[:user]["request"] = params[:request_type]
      if params[:request_type] == 'renew' || params[:request_type] == 'technical service'
        session[:user]["item"] = params[:request_hw_renew_tech]
      else
        session[:user]["item"] = params[:request_hw_lost]
      end
      # New Request
      if form == 'new'
        redirect_to '/requests/forms/new'
      # Renew Request
      elsif form == 'renew'
        # check if selected item is owned by user
        # item = item_verification(params[:request_hw])
        redirect_to '/requests/forms/renew'
      end

    else
      render json: {message: 'Datos Incorrectos'}
    end
  end

  # New Request form
  def new_form
    # User information in Hash
    @user = session[:user]
    # Smartphones Models available
    @smartphones = available_smartphones()
    # Bam Models available_smartphones
    @bam = available_bams()
  end

  # Renew Request form
  def renew_form
    # User information in Hash
    @user = session[:user]
    # Smartphones Models available
    @smartphones = available_smartphones()
    # Bam Models available_smartphones
    @bam = available_bams()
  end

  ####################Trst Views and layouts#########################
  def test_new
    puts('nico')
  end
  ####################Trst Views and layouts#########################

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.permit(:request, :state, :contract, :file, :status, :comment, :closed_at, :user_id)
    end
end
