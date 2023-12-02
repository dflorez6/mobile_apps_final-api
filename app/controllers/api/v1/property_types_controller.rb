module Api
  module V1
    class PropertyTypesController < ApplicationController
      before_action :set_property_type, only: %i[ show update destroy ]

      # GET /property_types
      # GET /property_types.json
      def index
        @property_types = PropertyType.all
        render json: @property_types, status: 200
      end

      # GET /property_types/1
      # GET /property_types/1.json
      def show
        render json: @property_type, status: 200
      end

      # POST /property_types
      # POST /property_types.json
      def create
        @property_type = PropertyType.new(property_type_params)

        if @property_type.save
          render json: @property_type, status: 200
        else
          render json: @property_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /property_types/1
      # PATCH/PUT /property_types/1.json
      def update
        if @property_type.update(property_type_params)
          render json: @property_type, status: 200
        else
          render json: @property_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /property_types/1
      # DELETE /property_types/1.json
      def destroy
        if @property_type
          @property_type.destroy!
          render json: { message: "#{@property_type.name} was successfully deleted" }, status: 200
        else
          render json: @property_type.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_property_type
        @property_type = PropertyType.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def property_type_params
        params.require(:property_type).permit(:name)
      end

    end
  end
end
