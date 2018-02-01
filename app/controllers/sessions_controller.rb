class SessionsController < ApplicationController
  layout 'general_view'
  # Filter to protect page with login and session
  before_action :authenticate_user, :only => [:home, :profile, :setting]
  # dont call for sign up or login when active session is up
  before_action :save_login_state, :only => [:login, :login_attempt]

  def login
    #Login Form
  end

  def login_attempt
    authorized_user = Admin.authenticate(params[:username_or_email],params[:login_password])
    # If authorization is ok
    if authorized_user
      # save User id for session
      session[:user_id] = authorized_user.id
      flash[:notice] = "Bienvenido, te has logeado como: #{authorized_user.username}"
      redirect_to(action: 'home')
    # if not
    else
      flash[:alert] = "Usuario o Contraseña Inválido"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

  def home
  end

  def profile
  end

  def setting
  end

end
