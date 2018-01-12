class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  skip_before_action :verify_authenticity_token

  # RUT Verification
  def rut_verification(rut)
    rut.strip!
    rut.delete!(".")

    # Query to CCU DB
    begin
      # First view created for web
      query_1 = "select * from sysadm.ps_v88rh_emplee_vw where "
      # Second view created for web
      query_2 = "select * from ps_v88rh_phonereq_vw where "
      query_id = "emplid = '"+rut+"'"
      view= ActiveRecord::Base.connection.execute(query_2+query_id)
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
    if !User.where(national_id: user["EMPLID"]).empty?
      user_db = User.where(national_id: user["EMPLID"]).first
      user_db.update_attributes!(jobtitle: user["JOBTITLE"], company: user["COMPANY"],
        deptname: user["DEPTNAME"], jobcode: user["JOBCODE"], location: user["LOCATION"],
        supervisor: user["SUPERVISOR_ID"], supervisor_jobtitle: user["SUPERVISOR_JOBTITLE"],
        supervisor_email: user["SUPERVISOR_EMAIL"], job_family: user["JOB_FAMILY"],
        country: user["COUNTRY"])
    else
      user_db = User.create!(name: name, last_name: last_name, email: user["EMAIL_ADDR"],
        national_id: user["EMPLID"], jobtitle: user["JOBTITLE"], company: user["COMPANY"],
        deptname: user["DEPTNAME"], jobcode: user["JOBCODE"], location: user["LOCATION"],
        supervisor: user["SUPERVISOR_NAME"], supervisor_jobtitle: user["SUPERVISOR_JOBTITLE"],
        supervisor_email: user["SUPERVISOR_EMAIL"], job_family: user["JOB_FAMILY"],
        country: user["COUNTRY"])
    end
    return user_db
  end

  # Get all smartphones availables for the country
  def available_smartphones_all(country)
    sp = Smartphone.select('id, model, code, price').where('state= ? AND country= ?',
      'catalog',country).uniq(&:code)
    # Format to show in view
    smp = sp.map { |m| [m.model, m.id] }
    return smp
  end

  # Get smartphones availables for the country by category
  def available_smartphones_category(country, category)
    sp = Smartphone.select('id, model, code, price, category').where('state= ? AND country= ? AND (category= ? OR category= ?)',
    'catalog',country, category, 'ALL')
    # Format to show in view
    smp = sp.map { |m| [m.model, m.id] }
    return smp

  end

  # Get bams availables for users (all categories can access the models)
  def available_bams(country)
    bm = Bam.select('id, model, code, price').where('state= ? AND country= ?','catalog',
      country)
    # Format to show in view
    bam = bm.map { |m| [m.model, m.id] }
    return bam
  end

  # Get bams availables plans for users (all categories can access the plans)
  def plans_available_bam(country)
    plan = Plan.select('id, name, detail, price').where('country= ? AND item= ?',
      country, 'bam')
    # Format to show in view
    plans = plan.map { |m| [m.name, m.id] }
    # Format to display details of plans
    details = plan.map {|m| [m.id, m.detail]}
    return [plans, details]
  end

  # Get Roamming availables plans for users (all categories can access the plans)
  def roaming_plans(country)
    plan = Plan.select('id, name, detail, price').where('country= ? AND plan_type = ? AND item= ?',
      country, 'plan', 'roaming')
    # Format to show in view
    plans = plan.map { |m| [m.name, m.id] }
    # Format to display details of plans
    details = plan.map {|m| [m.id, m.detail]}
    return [plans, details]
  end

  # Get Roamming availables bags for users (all categories can access the plans)
  def roaming_bags(country)
    plan = Plan.select('id, name, detail, price').where('country= ? AND plan_type = ? AND item= ?',
      country, 'bag', 'roaming')
    # Format to show in view
    plans = plan.map { |m| [m.name, m.id] }
    # Format to display details of plans
    details = plan.map {|m| [m.id, m.detail]}
    return [plans, details]
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

  # Build message for request and email
  def build_message(att)
    user = User.find(att["user_id"])
    user_info = user["name"]+" "+user["last_name"]+", "+user["jobtitle"]+
    ", perteneciente al centro de costos "+user["deptname"]+", a cursado una solicitud para "

    if att["request"] == "transfer line"
      ms = user_info+att["transfer_line_type"]+" su linea de teléfono con número telefónico: +56 9 "+att["phone_number"]
    end

    return ms
  end


end
