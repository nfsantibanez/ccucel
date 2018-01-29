class UserMailer < ApplicationMailer

  def supervisor_email(user, request)
    puts('entrando a mailer')
    @n_link = request.link
    @supervisor = user.supervisor
    @to = user.supervisor_email
    @subject = request.name+" a creado la solicitud n° "+request.n_request+" que necesita su aprobación."
    @body = request.email_sended+"."
    # @link = "Para aprobar/rechazar la solicitud debe ingrese al siguiente link: "+requests_url+"/validations/"+request.n_request
    #, body: @body+@link
    mail(to: @to, subject: @subject)
  end

end
