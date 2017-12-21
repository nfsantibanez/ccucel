class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  skip_before_action :verify_authenticity_token

  # RUT Verification
  def rut_verification(rut)
    rut.strip!
    rut.delete!(".")
    # if !rut.include?("-") then rut.insert(-2,"-") unless rut.empty? end

    # Query to CCU DB
    query_1 = "select * from sysadm.ps_v88rh_emplee_vw where "
    query_2 = "emplid = '"+rut+"'"
    view= ActiveRecord::Base.connection.execute(query_1+query_2)
    db_user = view.fetch_hash

    # Verify is user exists
    if !db_user
      return 0
    else
      return convert_user(db_user)
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

  # Convert info user form CCU DB
  def convert_user(user)
    # split name and last_name
    name = user["NAME"].split(",")[0]
    last_name = user["NAME"].split(",")[1]
    # save or update user info
    if !User.where(rut: user["NATIONAL_ID"]).empty?
      user_db = User.where(rut: user["NATIONAL_ID"]).first
      user_db.update_attributes!(jobtitle: user["JOBTITLE"], company: user["COMPANY"],
        deptname: user["DEPTNAME"], business_unit: user["BUSINESS_UNIT"],
        jobcode: user["JOBCODE"], location: user["LOCATION"], supervisor: user["SUPERVISOR_ID"],
        supervisor_email: user["SUPERVISOR_ID"]+'@ccu.cl')
    else
      user_db = User.create!(name: name, last_name: last_name, email: name[0..1]+last_name[0..3]+'@ccu.cl',
        rut: user["NATIONAL_ID"], jobtitle: user["JOBTITLE"], company: user["COMPANY"],
        deptname: user["DEPTNAME"], business_unit: user["BUSINESS_UNIT"], jobcode: user["JOBCODE"],
        location: user["LOCATION"], supervisor: user["SUPERVISOR_ID"], supervisor_email: user["SUPERVISOR_ID"]+'@ccu.cl')
    end
    return user_db
  end

  # Get unique smartphones availables #without jobtitle filter
  def available_smartphones
    smartphones = 'sss'
  end


end
