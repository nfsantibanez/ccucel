json.extract! user_record, :id, :smartphone_id, :sim_id, :bam_id, :user_id, :created_at, :updated_at
json.url user_record_url(user_record, format: :json)
