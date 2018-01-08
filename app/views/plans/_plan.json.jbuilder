json.extract! plan, :id, :item, :name, :price, :detail, :category, :nid_country, 
:created_at, :updated_at
json.url plan_url(plan, format: :json)
