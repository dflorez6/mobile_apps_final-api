module Api
  module V1
    class PropertiesController < ApplicationController
      before_action :set_property, only: %i[ show update destroy ]

      # GET /properties
      # GET /properties.json
      def index
        @properties = Property.all
        render json: @properties, status: 200
      end

      # GET /properties/1
      # GET /properties/1.json
      def show
        render json: @property, status: 200
      end

      # POST /properties
      # POST /properties.json
      def create
        @property = Property.new(property_params)

        if @property.save
          render json: @property, status: 200
        else
          render json: @property.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /properties/1
      # PATCH/PUT /properties/1.json
      def update
        if @property.update(property_params)
          render json: @owner, status: 200
        else
          render json: @property.errors, status: :unprocessable_entity
        end
      end

      # DELETE /properties/1
      # DELETE /properties/1.json
      def destroy
        if @property
          @property.destroy!
          render json: { message: "#{@property.full_address} successfully deleted" }, status: 200
        else
          render json: @property.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_property
        @property = Property.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def property_params
        params.require(:property).permit(:street, :city, :postal_code, :province, :country, :latitude, :longitude, :is_apartment, :building_name, :tower_number, :unit_number, :rent_price, :owner_id)
      end

    end
  end
end
