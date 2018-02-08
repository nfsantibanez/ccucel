class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  after_action :update_activity_time
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
        supervisor: user["SUPERVISOR_NAME"], supervisor_jobtitle: user["SUPERVISOR_JOBTITLE"],
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

  # Get all catalog smartphones models
  def all_smartphones
    sp = Smartphone.select('id, model, code').where(state: 'catalog').uniq(&:code)
    # Format to show in filters
    smp = sp.map { |m| [m.model, m.model] }
    return smp
  end

  # Get all catalog bams models
  def all_bams
    bm = Bam.select('id, model, code').where(state: 'catalog').uniq(&:code)
    # Format to show in view
    bam = bm.map { |m| [m.model, m.model] }
    return bam
  end

  # Get all plans/bags for Roamming
  def all_bp_roaming
    plan = Plan.select('id, name').where('(plan_type = ? OR plan_type = ?) AND item= ?',
      'plan', 'bag', 'roaming')
    # Format to show in view
    plans = plan.map { |m| [m.name, m.name] }
    return plans
  end

  # Get all plans for bams
  def all_p_bam
    plan = Plan.select('id, name').where('plan_type = ? AND item= ?', 'plan', 'bam')
    # Format to show in view
    plans = plan.map { |m| [m.name, m.name] }
    return plans
  end

  # Get all info of smartphone
  def get_smartphone(id)
    sp = {}
    sp = Smartphone.find(id) unless id.empty?
    return sp
  end

  # Get all info of Bam
  def get_bam(id)
    bam = {}
    bam = Bam.find(id) unless id.empty?
    return bam
  end

  # Get all info of Plan/bag
  def get_plan(id)
    plan = {name: "Información no se encuentra en la Base de Datos"}
    plan = Plan.find(id) unless id.empty?
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

  # Get missing days to renew user's items
  def renew_date(user)
    # days = ((DateTime.now + 2.months) - DateTime.now).to_i
    output = {}
    output[:sp] = Smartphone.where(id: user["smartphone_id"]).first[:renovation_at] unless !user["smartphone_id"]
    if !output[:sp].present? then output.delete(:sp) else output[:sp].to_datetime end
    output[:sp] = output[:sp].to_datetime unless !output[:sp]
    output[:bam] = Bam.where(id: user["bam_id"]).first[:renovation_at] unless !user["bam_id"]
    if !output[:bam].present? then output.delete(:bam) else output[:bam].to_datetime end
    return output
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
    if user.plan_id
      plan = Plan.find(user.plan_id)
      items[:plan] = plan
    end
    return items
  end

  #Upload file
  def upload_file(file)
    File.open(Rails.root.join('public', 'uploads', file.original_filename), 'wb') do |f|
      f.write(file.read)
    end
  end


  # Build message for request and email
  def build_message
    user = User.find(params["user_id"])
    user_info = user["name"]+" "+user["last_name"]+" ("+user["email"]+"), "+user["jobtitle"]+
    ", perteneciente al centro de costos "+user["deptname"]+", a cursado una solicitud para "

    # Transfer line
    if params["request"] == "transfer line"
      ms = user_info+params["transfer_line_type"]+" su linea de teléfono con número telefónico: +56 9 "+
      params["phone_number"]
    # Smartphone
    elsif params["item"] == "smartphone"
      lost = ""
      motive = ""

      #if not technical service
      if params["request"] != "technical service"
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
      end

      # New
      if params["request"] == "new"
        ms = user_info+" un nuevo smartphone modelo "+params["model"]["model"]+
        ", con un valor de $"+params["model"]['price'].to_s+". "
        if params["want_sim"] == "true"
          ms+= "El smartphone debe traer tarjeta Sim y el número de teléfono asociado a él "
          if params["want_new_number"] == "true"
            ms+= "debe ser nuevo."
          else
            ms+= "será cedido por el usuario, correspondiente al número telefónico: +56 9 "+
            params["phone_number"]+"."
          end
        else
          ms+= "El smartphone no debe traer tarjeta Sim."
        end

      # Renew, stolen/lost
      elsif params["request"] == "renew" || params["request"] == "stolen/lost"
        ms = user_info+" renovar su smartphone, eligiendo el modelo "+params["model"]["model"]+
        ", con un valor de $"+params["model"]['price'].to_s+". "

        if params["request"] == "stolen/lost"
          ms = user_info+" un nuevo smartphone modelo "+params["model"]["model"]+
          ", con un valor de $"+params["model"]['price'].to_s+". "
          lost = " Esta solicitud fue cursada por la pérdido o robo del smartphone que el trabajador tenia asignado anteriormente."
        end

        if params["want_sim"] == "true"
          ms+= "El smartphone debe traer tarjeta Sim y el número de teléfono asociado a él "
          if params["number_type"] == "new"
            ms+= "debe ser nuevo."
            params["want_new_number"] = true
          elsif  params["number_type"] == "same"
            ms+= "será el mismo que tiene asignado actualmente el usuario, correspondiente al número telefónico: +56 9 "+
            params["same_number"]+"."
            params["want_new_number"] = false
            params["phone_number"] = params["same_number"]
          else
            ms+= "será cedido por el usuario, correspondiente al número telefónico: +56 9 "+
            params["phone_number"]+"."
            params["want_new_number"] = false
          end
        else
          ms+= "El smartphone no debe traer tarjeta Sim"
        end

      # technical service
      elsif params["request"] == "technical service"

        #If user want replacement
        if params["want_replacement"] == "true"
          replace= "El trabajador va a necesitar un dispositivo de reemplazo durante el periodo en que el smartphone es enviado al servicio técnico"
        else
          replace= "El trabajador no necesita un dispositivo de reemplazo durante el periodo en que el smartphone es enviado al servicio técnico"
        end

        #message
        ms = user_info+" enviar al servicio técnico su smartphone modelo "+
        params["model"]+", IMEI "+params["imei"]+", con número telefónico +56 9 "+
        params["phone_number"]+". El desperfecto que presenta el smartphone es "+
        params["comment"]+". "+replace

      ms+= motive+lost
      end

    # Bam
    elsif params["item"] == "bam"

      if params["request"] != "technical service"
      # Get bam model's info
      params["model"] = get_bam(params["model"])
      # Get bam plan's info
      params["plan"] = get_plan(params["plan"])
      end

      # New, stolen/lost
      if params["request"] == "new" || params["request"] == "stolen/lost"
        # Message
        ms = user_info+" un nuevo dispositivo Bam modelo "+params["model"]["model"]+",
        con el plan: "+params["plan"]["name"]+", el cual tiene un valor de $"+
        params["plan"]['price'].to_s+". "

        if params["request"] == "stolen/lost"
          ms+= " Esta solicitud fue cursada por la pérdido o robo del dispositivo Bam que el trabajador tenia asignado anteriormente."
        end

      # Renew
      elsif params["request"] == "renew"
        # Message
        ms = user_info+" renovar su dispositivo Bam, eligiendo el modelo "+params["model"]["model"]+
        ", con un valor de $"+params["model"]['price'].to_s+". El usuario mantendrá el mismo plan"

      # Technical service
    elsif params["request"] == "technical service"
        #If user want replacement
        if params["want_replacement"] == "true"
          replace= "El trabajador va a necesitar un dispositivo de reemplazo durante el periodo en que el dispositivo BAM es enviado al servicio técnico"
        else
          replace= "El trabajador no necesita un dispositivo de reemplazo durante el periodo en que el dispositivo BAM es enviado al servicio técnico"
        end
        #message
        ms = user_info+" enviar al servicio técnico su dispositivo BAM modelo "+
        params["model"]+", IMEI "+params["imei"]+". El desperfecto que presenta el BAM es "+
        params["comment"]+". "+replace
      end

    # Sim
    elsif params["item"] == "sim"
      # Message
      ms = user_info+" una nueva Sim y el número de teléfono asociado a él"

      if params["request"] == "stolen/lost"
        ms+= " debe ser el número telefónico: +56 9 "+params["phone_number"]+
        ". Esta solicitud fue cursada por la pérdido o robo de la Sim que el trabajador tenia asignado anteriormente."
      elsif params["want_new_number"] == "true"
        ms+= " debe ser nuevo."
      else
        # Message
        ms+= " será cedido por el usuario, correspondiente al número telefónico: +56 9 "+
        params["phone_number"]+"."
      end

    # Roaming
    elsif params["item"] == "roaming"
      # Get Roaming plan's info
      params["plan"] = get_plan(params["plan"])
      # Modify date
      date_split  =  params["start_date"].split("-")
      params["start_date"] = Date.parse(date_split[2]+"/"+date_split[1]+"/"+date_split[0])

      date_split  =  params["end_date"].split("-")
      params["end_date"] = Date.parse(date_split[2]+"/"+date_split[1]+"/"+date_split[0])
      # Message
      ms = user_info+" el servicio Roaming, con el plan: "+params["plan"]["name"]+
      ", el cual tiene un valor de $"+params["plan"]['price'].to_s+". El servicio
      se solicita ya que el trabajador viaja al extranjero debido a: "+params["comment"]+
      ", entre las fechas: "+params["start_date"].strftime('%d/%m/%Y')+" y "+params["end_date"].strftime('%d/%m/%Y')+"."
    end

    return ms
  end


  protected

  # User authentication
  def authenticate_user
    # manage session user validation
    if session[:user_id]
      # set current user object to @current_user object variable
      @current_user = Admin.find session[:user_id]
      return true
    else
      flash[:alert] = "Debe iniciar sesión para acceder a la página"
      redirect_to(:controller => 'sessions', action: 'login')
      return false
    end
  end

  # Prevent sign up and log views when session is active
  def save_login_state
    if session[:user_id]
      redirect_to requests_path
      return false
    else
      return true
    end
  end

  # Expire session timer
  def session_expiry
    get_session_time_left
    unless @session_time_left > 0
      flash[:alert] = "Tu sesión a caducado. Debes logearte nuevamente"
      sign_out
    end
  end

  # Time left for expiration
  def get_session_time_left
     expire_time = if session[:expires_at].blank? then (DateTime.now + 30.minutes) else session[:expires_at] end
     @session_time_left = (expire_time.to_datetime - DateTime.now).to_f
  end

  # update timer if user is active
  def update_activity_time
    session[:expires_at] = DateTime.now + 30.minutes
  end

  def sign_out
    session[:user_id] = nil
  end

end
