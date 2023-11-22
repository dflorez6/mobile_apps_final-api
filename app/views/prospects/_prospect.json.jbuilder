json.extract! prospect, :id, :first_name, :last_name, :name, :email, :password, :password_confirmation, :dob, :phone, :street, :city, :postal_code, :province, :country, :created_at, :updated_at
json.url prospect_url(prospect, format: :json)
