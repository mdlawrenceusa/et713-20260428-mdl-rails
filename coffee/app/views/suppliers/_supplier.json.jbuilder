json.extract! supplier, :id, :name, :address, :city, :state, :email, :phone, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
