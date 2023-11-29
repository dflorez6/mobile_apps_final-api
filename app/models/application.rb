class Application < ApplicationRecord
  #====================
  # Validations
  #====================
  validates_presence_of :property_id, :prospect_id, :application_date

  #====================
  # Associations
  #====================
  # Belongs_to
  belongs_to :property
  belongs_to :prospect

  #====================
  # Scopes
  #====================
  default_scope { order(created_at: :desc) }
end

# TODO: AddMigration application_message:text