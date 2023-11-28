class PropertyImage < ApplicationRecord
  #====================
  # Validations
  #====================
  validates_presence_of :property_id

  #====================
  # Associations
  #====================
  # Belongs_to
  belongs_to :property

  #====================
  # Uploaders
  #====================
  mount_uploader :image, PropertyImageUploader

  #====================
  # Scopes
  #====================
  default_scope { order(created_at: :desc) }
end
