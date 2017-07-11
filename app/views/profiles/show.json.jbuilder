json.(@current_user, :name, :phone, :preferences, :age, :height, :weight)
json.plan @current_user.plan
json.address @current_user.address