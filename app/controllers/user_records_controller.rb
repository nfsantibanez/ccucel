class UserRecordsController < ApplicationController
  before_action :set_user_record, only: [:show, :edit, :update, :destroy]
  layout 'general_view'

  # GET /user_records
  # GET /user_records.json
  def index
    @user_records = UserRecord.all
  end

  # GET /user_records/1
  # GET /user_records/1.json
  def show
  end

  # GET /user_records/new
  def new
    @user_record = UserRecord.new
  end

  # GET /user_records/1/edit
  def edit
  end

  # POST /user_records
  # POST /user_records.json
  def create
    @user_record = UserRecord.new(user_record_params)

    respond_to do |format|
      if @user_record.save
        format.html { redirect_to @user_record, notice: 'User record was successfully created.' }
        format.json { render :show, status: :created, location: @user_record }
      else
        format.html { render :new }
        format.json { render json: @user_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_records/1
  # PATCH/PUT /user_records/1.json
  def update
    respond_to do |format|
      if @user_record.update(user_record_params)
        format.html { redirect_to @user_record, notice: 'User record was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_record }
      else
        format.html { render :edit }
        format.json { render json: @user_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_records/1
  # DELETE /user_records/1.json
  def destroy
    @user_record.destroy
    respond_to do |format|
      format.html { redirect_to user_records_url, notice: 'User record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_record
      @user_record = UserRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_record_params
      params.require(:user_record).permit(:smartphone_id, :sim_id, :bam_id, :user_id)
    end
end
