class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # RUT Verification
  def rut_verification(rut)
    rut.strip!
    rut.delete!(".")
    rut_1 = rut.dup
    rut_2 = rut.insert(-2,"-") unless rut.empty?
    user = User.where('rut=? OR rut=?', rut_1, rut_2)
    if user.empty?
      return 0
    else
      return user.first
    end
  end

  # Convert to official request types
  def form_convert(type)
    if type == "1"
      return 'new'
    elsif  type == "2"
      return 'renew'
    elsif  type == "3"
      return 'lost'
    elsif  type == "4"
      return 'stolen'
    elsif  type == "5"
      return 'technical service'
    else
      return 0
    end
  end


end
