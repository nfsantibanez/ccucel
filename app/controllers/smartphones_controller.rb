class SmartphonesController < ApplicationController
  layout 'general_view', except: [:index, :show, :edit, :update]
  layout 'admin_view', only: [:create]

  before_action :set_smartphone, only: [:show, :edit, :update, :destroy]
  # Filter to protect page with login and session
  before_action :authenticate_user
  # check session timer
  before_action :session_expiry

  # GET /smartphones
  # GET /smartphones.json
  def index
    @search = Smartphone.search(params[:q])
    @smartphones  = @search.result
    @all_smp = all_smartphones
    @all_smp.unshift(['Todos',''])

    render layout: 'admin_view'
  end

  # GET /smartphones/1
  # GET /smartphones/1.json
  def show
    render layout: 'admin_view'
  end

  # GET /smartphones/new
  def new
    @smartphone = Smartphone.new
    render layout: 'admin_view'
  end

  # GET /smartphones/1/edit
  def edit
    render layout: 'admin_view'
  end

  # POST /smartphones
  # POST /smartphones.json
  def create
    @smartphone = Smartphone.new(smartphone_params)

    respond_to do |format|
      if @smartphone.save
        format.html { redirect_to @smartphone, notice: 'Smartphone fue creado exitosamente' }
        format.json { render :show, status: :created, location: @smartphone }
      else
        format.html { redirect_to new_smartphone_url, alert:  @smartphone.errors }
        format.json { render json: @smartphone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smartphones/1
  # PATCH/PUT /smartphones/1.json
  def update
    respond_to do |format|
      if @smartphone.update(smartphone_params)
        format.html { redirect_to @smartphone, notice: 'Smartphone was successfully updated.' }
        format.json { render :show, status: :ok, location: @smartphone }
      else
        format.html { redirect_to @smartphone, alert:  @smartphone.errors}
        format.json { render json: @smartphone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smartphones/1
  # DELETE /smartphones/1.json
  def destroy
    @smartphone.destroy
    respond_to do |format|
      format.html { redirect_to smartphones_url, notice: 'Smartphone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smartphone
      @smartphone = Smartphone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def smartphone_params
      params.require(:smartphone).permit(:model, :phone_number, :code, :category, :country,
        :imei, :price, :state, :available, :renovation_at, :order, :order_name, :order_type)
    end
end
