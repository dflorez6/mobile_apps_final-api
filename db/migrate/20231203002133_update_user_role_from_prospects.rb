class UpdateUserRoleFromProspects < ActiveRecord::Migration[7.1]
  def change
    change_column_default :prospects, :user_role, "prospect"
  end
end
