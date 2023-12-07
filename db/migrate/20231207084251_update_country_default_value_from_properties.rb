class UpdateCountryDefaultValueFromProperties < ActiveRecord::Migration[7.1]
  def change
    change_column_default :properties, :country, "Canada"
  end
end
