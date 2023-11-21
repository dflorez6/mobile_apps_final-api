class Country < ApplicationRecord
  #====================
  # Validations
  #====================
  validates_presence_of :name_en
  validates_uniqueness_of :name_en
  
  #====================
  # Scopes
  #====================
  default_scope { order(name_en: :asc) }
end
