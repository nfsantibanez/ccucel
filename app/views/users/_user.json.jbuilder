json.extract! user, :id, :national_id, :name, :last_name, :email, :nid_country,
:jobtitle, :company, :supervisor, :supervisor_email, :deptname, :business_unit,
:jobcode, :location, :smartphone_id, :bam_id, :sim_id, :created_at, :updated_at
json.url user_url(user, format: :json)
