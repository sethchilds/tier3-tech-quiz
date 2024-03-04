json.extract! order, :id, :user_id, :description, :quantity, :total, :order_date, :created_at, :updated_at
json.url order_url(order, format: :json)
