class AddGeolocationToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :geolocation, :st_point, srid: 4326, geographic: true
  end
end