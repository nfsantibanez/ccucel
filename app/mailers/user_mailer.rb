class UserMailer < ApplicationMailer

  def supervisor_email(user, request)
    puts('entrando a mailer')

    @to = user.supervisor_email
    @subject = request.name+" a creado una solicitud que necesita su aprobación"
    @body = "n° de Solicitud: "+request.n_request+"\n\n"+request.email_sended+"\n\n"
    @link = "Para aprobar/rechazar la solicitud debe ingrese al siguiente link: "+requests_url+"/validations/"+request.n_request

    mail(to: @to, subject: @subject, content_type: "text/html", body: @body+@link)
    puts(@to, @subject, @body, @link)
  end

end
