class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.references :property, null: false, foreign_key: true
      t.references :prospect, null: false, foreign_key: true
      t.datetime :application_date

      t.timestamps
    end
  end
end
