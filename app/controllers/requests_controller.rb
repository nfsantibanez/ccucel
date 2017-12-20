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
    @user = rut_verification(params[:user_rut])
    form = form_convert(params[:request_type])

    # Redirect to correct form
    if form == 'new' and @user == 0
      redirect_to '/requests/forms/new'
    end
    #render json: {req: form, user: user}
  end

  # New Request form
  def new_form
    # Query all rows
    view= ActiveRecord::Base.connection.execute("select * from sysadm.ps_v88rh_emplee_vw")
    while r = view.fetch_hash
      puts(r)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:request, :state, :contract, :file, :status, :comment, :closed_at, :user_id)
    end
end
