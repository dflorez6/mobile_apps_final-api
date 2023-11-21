class Owner < ApplicationRecord
  #====================
  # Validations
  #====================

  #====================
  # Associations
  #====================
  # Has-Many
  # has_many :properties

  #====================
  # Scopes
  #====================
  default_scope { order(created_at: :desc) }

  #====================
  # Methods
  #====================

end
