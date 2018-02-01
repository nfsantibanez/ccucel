class UsersController < ApplicationController
  layout 'general_view' , except: [:create_user, :index, :show, :edit, :update, :new]
  layout 'admin_view', only: [:create]

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # Filter to protect page with login and session
  before_action :authenticate_user
  # check session timer
  before_action :session_expiry

  # GET /users
  # GET /users.json
  def index
    @search = User.search(params[:q])
    @users  = @search.result
    render layout: 'admin_view'
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render layout: 'admin_view'
  end

  # GET /users/new
  def new
    @user = User.new
    render layout: 'admin_view'
  end

  # GET /users/1/edit
  def edit
    render layout: 'admin_view'
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuario fue creado exitosamente'}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to new_user_url, alert:  @user.errors }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      puts(params)
      if @user.update(user_params)
        puts('exito')
        format.html { redirect_to @user, notice: 'Usuario fue editado exitosamente' }
        format.json { render :show, status: :ok, location: @user }
      else
        puts('fracaso')
        format.html { redirect_to @user, alert:  @user.errors }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuario fue borrado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:national_id, :name, :last_name, :email, :country,
        :jobtitle, :job_family, :company, :supervisor, :supervisor_email,
        :supervisor_jobtitle, :jobcode, :location, :deptname, :smartphone_id,
        :bam_id, :sim_id, :plan_id)
    end
end
