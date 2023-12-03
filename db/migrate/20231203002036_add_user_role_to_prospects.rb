class AddUserRoleToProspects < ActiveRecord::Migration[7.1]
  def change
    add_column :prospects, :user_role, :string
  end
end
