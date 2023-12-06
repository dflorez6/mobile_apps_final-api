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

  # Named scopes
  scope :filter_by_params, -> (params) {
    scope = self.all

    if params[:prospect_id].present?
      # Returns the collection of Applications where params[:prospect_id] == prospect_id
      scope = scope.where(prospect_id: params[:prospect_id])
    elsif params[:owner_id].present?
      # Returns the collection of Applications with properties belonging to a specific Owner
      scope = scope.joins(property: :owner).where(owners: { id: params[:owner_id] })
    end

    scope
  }

end