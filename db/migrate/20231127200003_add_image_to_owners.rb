class AddImageToOwners < ActiveRecord::Migration[7.1]
  def change
    add_column :owners, :image, :string
  end
end
