class AddStatusToApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :status, :string, default: "pending"
  end
end
