json.extract! smartphone, :id, :model, :code, :category, :country, :imei, :price,
:state, :order, :order_name, :order_type, :available, :renovation_at, :created_at,
:updated_at
json.url smartphone_url(smartphone, format: :json)
