class UpdateImageDefaultPathFromOwners < ActiveRecord::Migration[7.1]
  def change
    change_column_default :owners, :image, "image/upload/v1701561789/fhx28zsa9swgxs1xhsm7.png"
  end
end
