class SimsController < ApplicationController
  layout 'general_view', except: [:index, :show, :edit, :update, :new]
  layout 'admin_view', only: [:create]

  before_action :set_sim, only: [:show, :edit, :update, :destroy]
  # Filter to protect page with login and session
  before_action :authenticate_user
  # check session timer
  before_action :session_expiry

  # GET /sims
  # GET /sims.json
  def index
    @sims = Sim.all
    @search = Sim.search(params[:q])
    @sims  = @search.result

    render layout: 'admin_view'
  end

  # GET /sims/1
  # GET /sims/1.json
  def show
    render layout: 'admin_view'
  end

  # GET /sims/new
  def new
    @sim = Sim.new
    render layout: 'admin_view'
  end

  # GET /sims/1/edit
  def edit
    render layout: 'admin_view'
  end

  # POST /sims
  # POST /sims.json
  def create
    @sim = Sim.new(sim_params)

    respond_to do |format|
      if @sim.save
        format.html { redirect_to @sim, notice: 'Sim fue creada exitosamente' }
        format.json { render :show, status: :created, location: @sim }
      else
        format.html { redirect_to new_sim_url, alert:  @sim.errors }
        format.json { render json: @sim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sims/1
  # PATCH/PUT /sims/1.json
  def update
    respond_to do |format|
      if @sim.update(sim_params)
        format.html { redirect_to @sim, notice: 'Sim fue editada exitosamente' }
        format.json { render :show, status: :ok, location: @sim }
      else
        format.html  { redirect_to @sim, alert:  @sim.errors }
        format.json { render json: @sim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sims/1
  # DELETE /sims/1.json
  def destroy
    @sim.destroy
    respond_to do |format|
      format.html { redirect_to sims_url, notice: 'Sim fue borrada exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sim
      @sim = Sim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sim_params
      params.require(:sim).permit(:phone_number, :serial_number, :country, :state,
        :available, :order, :order_name, :order_type)
    end
end
