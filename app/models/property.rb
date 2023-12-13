class Property < ApplicationRecord
  #====================
  # Validations
  #====================
  validates_presence_of :owner_id, :property_type_id

  #====================
  # Associations
  #====================
  # Many-to-Many
  has_many :applications, dependent: :destroy
  has_many :prospects, through: :applications

  # Has-Many
  has_many :property_images, dependent: :destroy

  # Belongs_to
  belongs_to :owner
  belongs_to :property_type

  #====================
  # Scopes
  #====================
  default_scope { order(created_at: :desc) }

  # This scope takes a hash of parameters (params), and for each key-value pair in the hash, it adds a where clause to
  # the scope. The result is a dynamically constructed query that filters records based on the provided parameters.
  # You can use this scope like YourModel.filter_by_params(request.query_parameters) to dynamically filter records
  # based on the query parameters from an HTTP request.
  # Using reduce to merge all the parameters into a single hash. This ensures that the conditions are combined with
  # an AND operation. The resulting where clause will only return records that meet all the specified conditions.
  # This approach initializes the where clause with YourModel.all and then iteratively adds conditions using where for
  # each parameter. This way, it can handle any number of parameters dynamically.
  scope :filter_by_params, -> (params) {
    where_clause = params.reduce(self.all) do |scope, (key, value)|
      scope.where(key => value)
    end
    where_clause
  }

  #====================
  # Methods
  #====================
  # Custom method to concatenate values to display full address
  def full_address
    "#{self.street}, #{self.city}, #{self.postal_code}, #{self.province}, #{self.country}"
  end

end

# TODO: For migration that will use PostGIS, once deployment issue on render.com is fixed:
# t.st_point :geolocation, geographic: true
# t.index :geolocation, using: :gist