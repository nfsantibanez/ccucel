class BamsController < ApplicationController
  before_action :set_bam, only: [:show, :edit, :update, :destroy]
  layout 'general_view', except: [:index, :show, :edit, :update, :new]
  layout 'admin_view', only: [:create]

  # GET /bams
  # GET /bams.json
  def index
    @search = Bam.search(params[:q])
    @bams  = @search.result
    @all_bam = all_bams
    @all_bam.unshift(['Todos',''])

    render layout: 'admin_view'
  end

  # GET /bams/1
  # GET /bams/1.json
  def show
    render layout: 'admin_view'
  end

  # GET /bams/new
  def new
    @bam = Bam.new
    render layout: 'admin_view'
  end

  # GET /bams/1/edit
  def edit
    render layout: 'admin_view'
  end

  # POST /bams
  # POST /bams.json
  def create
    @bam = Bam.new(bam_params)

    respond_to do |format|
      if @bam.save
        format.html { redirect_to @bam, notice: 'Bam fue creada exitosamente' }
        format.json { render :show, status: :created, location: @bam }
      else
        format.html { redirect_to new_bam_url, alert:  @bam.errors }
        format.json { render json: @bam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bams/1
  # PATCH/PUT /bams/1.json
  def update
    respond_to do |format|
      if @bam.update(bam_params)
        format.html { redirect_to @bam, notice: 'Bam fue editada exitosamente' }
        format.json { render :show, status: :ok, location: @bam }
      else
        format.html { redirect_to @bam, alert:  @bam.errors }
        format.json { render json: @bam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bams/1
  # DELETE /bams/1.json
  def destroy
    @bam.destroy
    respond_to do |format|
      format.html { redirect_to bams_url, notice: 'Bam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bam
      @bam = Bam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bam_params
      params.require(:bam).permit(:model, :plan, :code, :country, :imei, :price,
        :state, :available, :renovation_at, :order, :order_name, :order_type)
    end
end
