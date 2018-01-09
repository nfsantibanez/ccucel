class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  skip_before_action :verify_authenticity_token

  # RUT Verification
  def rut_verification(rut)
    rut.strip!
    rut.delete!(".")

    # Query to CCU DB
    begin
      query_1 = "select * from sysadm.ps_v88rh_emplee_vw where "
      query_2 = "emplid = '"+rut+"'"
      view= ActiveRecord::Base.connection.execute(query_1+query_2)
      db_user = view.fetch_hash
    # If there is no connection to DB
    rescue
      db_user = -1
    end

    # Verify is user exists
    if !db_user
      return 0
    elsif db_user == -1 and Rails.env.test?
      return User.where(national_id: rut).first
    else
      return convert_user(db_user)
    end
  end

  # Convert info user from CCU DB
  def convert_user(user)
    # split name and last_name
    name = user["NAME"].split(",")[0]
    last_name = user["NAME"].split(",")[1]
    # save or update user info in app DB
    if !User.where(national_id: user["NATIONAL_ID"]).empty?
      user_db = User.where(national_id: user["NATIONAL_ID"]).first
      user_db.update_attributes!(jobtitle: user["JOBTITLE"], company: user["COMPANY"],
        deptname: user["DEPTNAME"], business_unit: user["BUSINESS_UNIT"],
        jobcode: user["JOBCODE"], location: user["LOCATION"], supervisor: user["SUPERVISOR_ID"],
        supervisor_email: user["SUPERVISOR_ID"]+'@ccu.cl', nid_country: user["NID_COUNTRY"])
    else
      user_db = User.create!(name: name, last_name: last_name, email: name[0..1]+last_name[0..3]+'@ccu.cl',
        national_id: user["NATIONAL_ID"], jobtitle: user["JOBTITLE"], company: user["COMPANY"],
        deptname: user["DEPTNAME"], business_unit: user["BUSINESS_UNIT"], jobcode: user["JOBCODE"],
        location: user["LOCATION"], supervisor: user["SUPERVISOR_ID"],
        supervisor_email: user["SUPERVISOR_ID"]+'@ccu.cl', nid_country: user["NID_COUNTRY"])
    end
    return user_db
  end

  # Get all smartphones availables for the country
  def available_smartphones_all(country)
    sp = Smartphone.select('model, code, price').where('state= ? AND country= ?','catalog',country).uniq(&:code)
    # Format to show in view
    smp = sp.map { |m| [m.model, m] }
    return smp
  end

  # Get smartphones availables for the country by category
  def available_smartphones_category(country, category)
    sp = Smartphone.select('model, code, price category').where('state= ? AND country= ? AND (category= ? OR category= ?)','catalog',country, category, 'all')
    # Format to show in view
    smp = sp.map { |m| [m.model, m] }
    return smp

  end

  # Get bams availables for user jobtitle
  def available_bams(country)

  end

  # Get missing days to renew item
  def renew_date(id, item)
    days = ((DateTime.now + 2.months) - DateTime.now).to_i
    return days
  end

  # know if user have an item assigned and return info
  def get_items(rut)
    user = User.find_by_national_id(rut)
    items= {}
    if user.smartphone_id
      sp = Smartphone.find(user.smartphone_id)
      items[:sp] = sp
    end
    if user.bam_id
      bam = Bam.find(user.bam_id)
      items[:bam] = bam
    end
    if user.sim_id
      sim = Sim.find(user.sim_id)
      items[:sim] = sim
    end
    return items
  end


end
