json.extract! order, :id, :agrovet_id, :order_number, :product_1_quantity, :product_2_quantity, :product_3_quantity, :product_4_quantity, :product_5_quantity, :product_6_quantity, :product_7_quantity,:total_amount, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
