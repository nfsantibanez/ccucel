class UserMailer < ApplicationMailer

  def supervisor_email(user, request)
    puts(5*'entrando a super_mailer')
    @n_link = request.link
    @supervisor = user.supervisor
    @to = 'solcelulares@ccu.cl '# user.supervisor_email
    @subject = request.name+" a creado la solicitud n° "+request.n_request+" que necesita su aprobación."
    @body = request.email_sended+"."
    mail(to: @to, subject: @subject)
  end

  def admin_email(user, request)
    puts(5*'entrando a admin_mailer')
    @user = user
    @request = request
    @to = 'solcelulares@ccu.cl'
    @subject = request.name+" a creado la solicitud n° "+request.n_request+" que necesita su aprobación."
    @body = request.email_sended+"."
    mail(to: @to, subject: @subject)
  end

  def user_email(user, request)
    puts(5*'entrando a user_mailer')
    @user = user
    @to = 'solcelulares@ccu.cl' # user.email
    @subject = "Se ha creado la Solicitud n° "+request.n_request
    @body = "Usted a creado la solicitud n° "+request.n_request

    mail(to: @to, subject: @subject)
  end

  def change_email(user, request, change)
    puts(5*'entrando a change_mailer')
    @user = user
    @request = request
    @change = change
    @to = 'solcelulares@ccu.cl' # user.email
    @subject = "Cambio de estado de Solicitud n° "+request.n_request
    @body = "La solicitud n° "+request.n_request+" ha cambiado de estado a "

    mail(to: @to, subject: @subject)
  end

end
