class SessionsController < ApplicationController
  layout 'general_view'
  before_action :clean_fields, only: [:login, :login_attempt]
  # Filter to protect page with login and session
  before_action :authenticate_user, only: [:home, :profile, :setting]
  # dont call for sign up or login when active session is up
  before_action :save_login_state, :only => [:login, :login_attempt]
  #
  def login
    #Login Form
  end

  def login_attempt
    authorized_user = Admin.authenticate(params[:username_or_email],params[:login_password])
    # If authorization is ok
    if authorized_user
      # save User id for session
      session[:user_id] = authorized_user.id
      redirect_to requests_path
    # if not
    else
      flash.now[:alert] = "Usuario o Contraseña Inválido"
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

  private

  # to lower case and strip uasename or email
  def clean_fields
    params[:username_or_email].downcase! unless params[:username_or_email].blank?
    params[:username_or_email].strip! unless params[:username_or_email].blank?
  end


end
