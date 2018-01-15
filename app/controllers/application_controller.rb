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

  # Get all info of smartphone
  def get_smartphone(id)
    sp = Smartphone.find(id)
    return sp
  end

  # Get all info of Bam
  def get_bam(id)
    bam = Bam.find(id)
    return bam
  end

  # Get all info of Plan/bag
  def get_plan(id)
    plan = Plan.find(id)
    return plan
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
  def build_message
    user = User.find(params["user_id"])
    user_info = user["name"]+" "+user["last_name"]+" ("+user["email"]+"), "+user["jobtitle"]+
    ", perteneciente al centro de costos "+user["deptname"]+", a cursado una solicitud para "

    # Transfer line
    if params["request"] == "transfer line"
      ms = user_info+params["transfer_line_type"]+" su linea de teléfono con número telefónico: +56 9 "+params["phone_number"]
    # Smartphone
    elsif params["item"] == "smartphone"
      # Get smartphone info
      if params["want_all"] == '0'
        params["model"] = get_smartphone(params["model_one"])
        params["price"] =   params["model"]["price"]
        motive = ""
      else
        params["model"] = get_smartphone(params["model_all"])
        motive = " El modelo smartphone elegido no corresponde al cargo que tiene el trabajador.
        El motivo de la elección que ha dado el trabajador es: "+params["comment"]+"."
      end
      # New
      if params["request"] == "new"
        ms = user_info+" un nuevo smartphone modelo "+params["model"]["model"]+", con un valor de $"+params["model"]['price'].to_s+". "
        if params["want_sim"] == "true"
          ms+= "El smartphone debe traer tarjeta Sim y el número de teléfono asociado a él "
          if params["want_new_number"] == "true"
            ms+= "debe ser nuevo."
          else
            ms+= "será cedido por el usuario, correspondiente al número telefónico: +56 9 "+params["phone_number"]+"."
          end
        else
          ms+= "El smartphone no debe traer tarjeta Sim"
        end
      ms+= motive
      end

    # Bam
    elsif params["item"] == "bam"
      # Get bam model's info
      params["model"] = get_bam(params["model"])
      puts(params["model"])
      # Get bam plan''s info
      params["plan"] = get_plan(params["plan"])
      puts(params["plan"])
      # New
      if params["request"] == "new"
        # Message
        ms = user_info+" un nuevo Bam modelo "+params["model"]["model"]+", con el plan: "+params["plan"]["name"]+", el cual tiene un valor de $"+params["plan"]['price'].to_s+". "
      end

    # Sim
    elsif params["item"] == "sim"
      # Message
      ms = user_info+" una nueva Sim y el número de teléfono asociado a él"
      if params["want_new_number"] == "true"
        ms+= " debe ser nuevo."
      else
        # Message
        ms+= " será cedido por el usuario, correspondiente al número telefónico: +56 9 "+params["phone_number"]+"."

      end
    end

    return ms
  end


end
