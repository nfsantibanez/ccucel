class PlansController < ApplicationController
  layout 'general_view', except: [:index, :show, :edit, :update, :new]
  layout 'admin_view', only: [:create]

  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  # Filter to protect page with login and session
  before_action :authenticate_user
  # check session timer
  before_action :session_expiry

  # GET /plans
  # GET /plans.json
  def index
    @search = Plan.search(params[:q])
    @plans  = @search.result
    @all_bp_roaming = all_bp_roaming
    @all_bp_roaming.unshift(['Todos',''])
    @all_p_bam = all_p_bam
    @all_p_bam.unshift(['Todos',''])

    render layout: 'admin_view'
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    render layout: 'admin_view'
  end

  # GET /plans/new
  def new
    @plan = Plan.new
    render layout: 'admin_view'
  end

  # GET /plans/1/edit
  def edit
    render layout: 'admin_view'
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan/Bolsa fue creado exitosamente' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { edirect_to new_plan_url, alert:  @plan.errors }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan/Bolsa fue editado exitosamente' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { redirect_to @plan, alert:  @plan.errors }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:item, :plan_type, :name, :price, :detail, :country, :category)
    end
end
