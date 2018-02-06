class UserMailer < ApplicationMailer

  def supervisor_email(user, request)
    # puts('entrando a super_mailer')
    @no_data = 'SE HA ENVIADO ESTE CORREO YA QUE EL USUARIO QUE CREÓ LA SOLICITUD NO TIENE UN CORREO DE SUPERVISOR ASOCIADO'
    @n_link = request.link
    @supervisor = user.supervisor
    if Rails.env.test? || Rails.env.development?
      @to = 'solcelulares@ccu.cl'
    elsif Rails.env.production?
      @to = if user.supervisor_email.blank? then user.supervisor_email, @no_data='' else 'solcelulares@ccu.cl' end
    end
    @subject = request.name+" a creado la solicitud n° "+request.n_request+" que necesita su aprobación."
    @body = request.email_sended+"."
    mail(to: @to, subject: @subject)
  end

  def admin_email(user, request)
    # puts('entrando a admin_mailer')
    @user = user
    @request = request
    @to = 'solcelulares@ccu.cl'
    @subject = request.name+" a creado la solicitud n° "+request.n_request+" que necesita su aprobación."
    @body = request.email_sended+"."
    mail(to: @to, subject: @subject)
  end

  def user_email(user, request)
    # puts('entrando a user_mailer')
    @no_data = 'HA RECIBIDO ESTE CORREO YA QUE EL USUARIO QUE CREÓ LA SOLICITUD NO TIENE UN CORREO ASOCIADO'
    @user = user
    if Rails.env.test? || Rails.env.development?
      @to = 'solcelulares@ccu.cl '
    elsif Rails.env.production?
      @to = user.user_email
      @to = if user.user_email.blank? then user.user_email, @no_data='' else 'solcelulares@ccu.cl' end
    end
    @subject = "Se ha creado la Solicitud n° "+request.n_request
    @body = "Usted a creado la solicitud n° "+request.n_request

    mail(to: @to, subject: @subject)
  end

  def change_email(user, request, change)
    # puts('entrando a change_mailer')
    @user = user
    @request = request
    @change = change
    if Rails.env.test? || Rails.env.development?
      @to = 'solcelulares@ccu.cl '
    elsif Rails.env.production?
      @to = if !user.user_email.blank? then user.user_email else 'solcelulares@ccu.cl' end
    end
    @subject = "Cambio de estado de Solicitud n° "+request.n_request
    @body = "La solicitud n° "+request.n_request+" ha cambiado de estado a "

    mail(to: @to, subject: @subject)
  end

end
