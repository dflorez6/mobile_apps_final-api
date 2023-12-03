class UpdateImageDefaultValueFromOwners < ActiveRecord::Migration[7.1]
  def change
    change_column_default :owners, :image, "https://res.cloudinary.com/dxj6szh5w/image/upload/v1701561789/fhx28zsa9swgxs1xhsm7"
  end
end
