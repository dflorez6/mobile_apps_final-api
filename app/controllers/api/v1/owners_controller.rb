module Api
  module V1
    class OwnersController < ApplicationController
      before_action :set_owner, only: %i[ show update destroy ]

      # GET /owners
      # GET /owners.json
      def index
        @owners = Owner.all
        render json: @owners, status: 200
      end

      # GET /owners/1
      # GET /owners/1.json
      def show
        render json: @owner, status: 200
      end

      # POST /owners
      # POST /owners.json
      def create
        @owner = Owner.new(owner_params)

        if @owner.save
          render json: @owner, status: 200
        else
          render json: @owner.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /owners/1
      # PATCH/PUT /owners/1.json
      def update
        if @owner.update(owner_params)
          render json: @owner, status: 200
        else
          render json: @owner.errors, status: :unprocessable_entity
        end
      end

      # DELETE /owners/1
      # DELETE /owners/1.json
      def destroy
        if @owner
          @owner.destroy!
          render json: { message: "Country successfully deleted" }, status: 200
        else
          render json: @owner.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_owner
        @owner = Owner.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def owner_params
        params.require(:owner).permit(:first_name, :last_name, :name, :email, :password, :password_confirmation, :dob, :phone, :street, :city, :province, :postal_code, :is_business, :country, :website_url)
      end

    end
  end
end
