json.extract! request, :id, :request, :type, :contract, :file, :status, :comment, :closed_at, :user_id, :created_at, :updated_at
json.url request_url(request, format: :json)
