json.extract! user, :id, :national_id, :name, :last_name, :email, :jobtitle, :company, :supervisor, :supervisor_email, :deptname, :business_unit, :jobcode, :location, :created_at, :updated_at
json.url user_url(user, format: :json)
