class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :street
      t.string :city
      t.string :postal_code
      t.string :province
      t.string :country
      t.float :latitude, precision: 10, scale: 6
      t.float :longitude, precision: 10, scale: 6
      t.boolean :is_apartment
      t.string :building_name
      t.string :tower_number
      t.string :unit_number
      t.money :rent_price
      t.references :owner, null: false, foreign_key: true

      t.timestamps
      t.index %i[latitude longitude]
      t.index :rent_price
    end
  end
end