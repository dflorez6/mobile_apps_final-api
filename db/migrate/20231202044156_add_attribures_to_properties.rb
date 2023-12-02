class AddAttriburesToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :agreement, :string
    add_column :properties, :size, :integer
    add_column :properties, :bathrooms, :integer
    add_column :properties, :bedrooms, :integer
    add_column :properties, :move_in, :datetime
    add_column :properties, :back_yard, :boolean
    add_column :properties, :front_yard, :boolean
  end
end
