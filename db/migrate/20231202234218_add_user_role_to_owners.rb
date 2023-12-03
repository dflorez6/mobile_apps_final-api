class AddUserRoleToOwners < ActiveRecord::Migration[7.1]
  def change
    add_column :owners, :user_role, :string
  end
end
