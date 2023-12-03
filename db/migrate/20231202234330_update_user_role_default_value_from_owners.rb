class UpdateUserRoleDefaultValueFromOwners < ActiveRecord::Migration[7.1]
  def change
    change_column_default :owners, :user_role, "owner"
  end
end
