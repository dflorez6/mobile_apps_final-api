module Api
  module V1
    class AuthenticationsController < ApplicationController
      before_action :set_owner, only: %i[ login_owner ]
      before_action :set_prospect, only: %i[ login_prospect ]

      # Checks DB for an Owner with given email (passed from the mobile app)
      # If prospect exists: method will return 200 OK with the following Owner's data:
      # owner_id, name, first_name, last_name, email, phone, website_url & owner's image
      # If Owner doesn't exist: will return 404 NOT FOUND
      def login_owner
        if @owner.nil?
          render json: { message: 'Owner could not be found.' }, status: 404
        elsif @owner.password != params[:owner_password]
          render json: { message: 'Incorrect password.' }, status: 404
        else
          # render json: returned_owner(@owner), status: 200
          render json: @owner, status: 200
        end
      end

      # Checks DB for an Prospect with given email (passed from the mobile app)
      # If prospect exists: method will return 200 OK with the following Prospect's data:
      # prospect_id, first_name, last_name, email, phone & prospect's image
      # If Prospect doesn't exist: will return 404 NOT FOUND
      def login_prospect
        if @prospect.nil?
          render json: { message: 'Prospect could not be found.' }, status: 404
        elsif @prospect.password != params[:prospect_password]
          render json: { message: 'Incorrect password.' }, status: 404
        else
          render json: @prospect, status: 200
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_owner
        @owner = Owner.find_by_email(params[:owner_email])
      end

=begin
      def returned_owner(owner)
        Owner.new(owner.slice(
          :id, :first_name, :last_name, :name, :dob,
          :email, :phone, :street, :city, :province, :postal_code,
          :country, :website_url #, image: { url: owner.image.url }
        ))
      end
=end

      def set_prospect
        @prospect = Prospect.find_by_email(params[:prospect_email])
      end

    end
  end
end

# TODO: Make sure to name mobile app input names to this format
# puts params[:prospect_email]
# puts params[:prospect_password]
# # puts params[:owner_email]
# # puts params[:owner_password]