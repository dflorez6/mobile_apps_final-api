class Prospect < ApplicationRecord
  before_create :set_full_name

  #====================
  # Validations
  #====================
  validates_presence_of :email
  validates_uniqueness_of :email

  #====================
  # Associations
  #====================
  # Many-to-Many
  has_many :applications, dependent: :destroy
  has_many :properties, through: :applications

  #====================
  # Uploaders
  #====================
  mount_uploader :image, ProspectImageUploader

  #====================
  # Scopes
  #====================
  default_scope { order(created_at: :desc) }

  #====================
  # Methods
  #====================
  # Custom method that concatenates first_name + last_name in case the Owner is NOT a business
  def set_full_name
    self.name = "#{self.first_name} #{self.last_name}"
  end

  # Custom method to concatenate values to display full address
  def full_address
    "#{self.street}, #{self.city}, #{self.postal_code}, #{self.province}, #{self.country}"
  end
end
