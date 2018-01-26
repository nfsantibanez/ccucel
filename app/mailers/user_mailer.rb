class UserMailer < ApplicationMailer

  def supervisor_email(user, request)
    @to = user.supervisor_mail
    @subject = user.name+" a creado una solicitud que necesita su aprobación"
    @body = "n° de Solicitud: "+request.n_request+"/n/n"+request.email_sended+"/n/n"
    @link = "Para aprobar/rechazar la solicitud ingrese al siguiente link: "+requests_url+"/validations/"+request.n_request

    mail(to: @to, subject: @subject, content_type: "text/html", body: @body+@link)
  end

end
