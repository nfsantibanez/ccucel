json.extract! request, :id, :request, :item, :model, :plan, :classification, :contract,
:contract_type, :contract_name, :file, :file_type, :file_name, :status, :comment,
:comment_stolen_lost, :email_sended, :want_replacement, :want_sim, :want_new_number,
:number_type, :phone_number, :transfer_line_type, :price, :region, :country, :name,
:national_id, :email, :company, :deptname, :start_date, :end_date, :closed_at,
:user_id, :created_at, :updated_at
json.url request_url(request, format: :json)
