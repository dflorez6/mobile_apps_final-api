class CreateOwners < ActiveRecord::Migration[7.1]
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.date :dob
      t.string :phone
      t.string :street
      t.string :city
      t.string :province
      t.string :postal_code
      t.boolean :is_business, default: false
      t.string :country
      t.string :website_url

      t.timestamps
    end
  end
end

