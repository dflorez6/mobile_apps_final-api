class Property < ApplicationRecord
  #====================
  # Validations
  #====================

  #====================
  # Associations
  #====================
  # Many-to-Many
  # has_many :applications
  # has_many :prospects, through: :applications

  # Belongs_to
  belongs_to :owner

  #====================
  # Scopes
  #====================
  default_scope { order(created_at: :desc) }

  #====================
  # Method
  #====================
  def full_address
    "#{self.street}, #{self.city}, #{self.postal_code}, #{self.province}, #{self.country}"
  end
end


# t.st_point :geolocation, geographic: true
# t.index :geolocation, using: :gist