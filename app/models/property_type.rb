class PropertyType < ApplicationRecord
  #====================
  # Validations
  #====================
  validates_presence_of :name

  #====================
  # Associations
  #====================
  # Has-Many
  has_many :properties, dependent: :destroy

  #====================
  # Scopes
  #====================
  default_scope { order(name: :asc) }
end
