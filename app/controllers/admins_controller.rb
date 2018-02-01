class AdminsController < ApplicationController

  def new
    @admin = Admin.new
    render layout: 'general_view'
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = "El Sign Up ha sido exitoso"
    else
      flash[:alert] =  "Los siguientes errores impidieron el Sign Up: "
    end
    render "new", layout: 'general_view', locals: {notice: notice, alert: alert}

  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.permit(:username, :email, :password, :password_confirmation)
  end

end
