json.(@current_user, :name, :phone, :preferences, :age, :height, :weight, :plan_id)
json.plan @current_user.plan
json.address @current_user.address