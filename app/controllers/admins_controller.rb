class AdminsController < ApplicationController
  layout 'general_view'
  # can call @current_user in the templates (info aboute login user)
  before_action :save_login_state, only: [:new, :create]

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = "El Sign Up ha sido exitoso"
    else
      flash[:alert] =  "Los siguientes errores impidieron el Sign Up: "
    end
    render "new"
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.permit(:username, :email, :password, :password_confirmation)
  end

end
