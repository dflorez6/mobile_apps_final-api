class Owner < ApplicationRecord
  before_create :set_full_name

  #====================
  # Validations
  #====================

  #====================
  # Associations
  #====================
  # Has-Many
  has_many :properties

  #====================
  # Uploaders
  #====================
  mount_uploader :image, OwnerImageUploader

  #====================
  # Scopes
  #====================
  default_scope { order(created_at: :desc) }

  #====================
  # Methods
  #====================
  # Custom method that concatenates first_name + last_name in case the Owner is NOT a business
  def set_full_name
    unless self.is_business
      self.name = "#{self.first_name} #{self.last_name}"
    end
  end

  # Custom method to concatenate values to display full address
  def full_address
    "#{self.street}, #{self.city}, #{self.postal_code}, #{self.province}, #{self.country}"
  end

end
