json.extract! bean, :id, :supplier_id, :type, :product_name, :price, :description, :quantity, :created_at, :updated_at
json.url bean_url(bean, format: :json)
