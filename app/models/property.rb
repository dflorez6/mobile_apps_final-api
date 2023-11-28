class Property < ApplicationRecord
  #====================
  # Validations
  #====================

  #====================
  # Associations
  #====================
  # Many-to-Many
  has_many :applications
  has_many :prospects, through: :applications

  # Has-Many
  has_many :property_images, dependent: :destroy

  # Belongs_to
  belongs_to :owner

  #====================
  # Scopes
  #====================
  default_scope { order(created_at: :desc) }

  #====================
  # Method
  #====================
  # Custom method to concatenate values to display full address
  def full_address
    "#{self.street}, #{self.city}, #{self.postal_code}, #{self.province}, #{self.country}"
  end

end

# TODO: For migration that will use PostGIS, once deployment issue on render.com is fixed:
# t.st_point :geolocation, geographic: true
# t.index :geolocation, using: :gist