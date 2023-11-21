json.extract! owner, :id, :first_name, :last_name, :name, :email, :password, :password_confirmation, :dob, :phone, :street, :city, :province, :postal_code, :is_business, :country, :website_url, :created_at, :updated_at
json.url owner_url(owner, format: :json)
