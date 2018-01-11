json.extract! user, :id, :national_id, :name, :last_name, :email, :country,
:jobtitle, :job_family, :company, :supervisor, :supervisor_email, :supervisor_jobtitle,
:deptname, :jobcode, :location, :smartphone_id, :bam_id, :sim_id, :created_at, :updated_at
json.url user_url(user, format: :json)
