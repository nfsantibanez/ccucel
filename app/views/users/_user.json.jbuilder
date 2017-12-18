json.extract! user, :id, :rut, :name, :last_name, :email, :occupation, :enterprice, :supervisor, :supervisor_email, :cost_center, :job_center, :created_at, :updated_at
json.url user_url(user, format: :json)
