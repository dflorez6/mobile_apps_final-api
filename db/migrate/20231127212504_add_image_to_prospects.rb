class AddImageToProspects < ActiveRecord::Migration[7.1]
  def change
    add_column :prospects, :image, :string
  end
end
