module Api
  module V1
    class PropertyImagesController < ApplicationController
      before_action :set_property_image, only: %i[ show update destroy ]

      # GET /property_images
      # GET /property_images.json
      def index
        @property_images = PropertyImage.all
        render json: @property_images, status: 200
      end

      # GET /property_images/1
      # GET /property_images/1.json
      def show
        render json: @property_image, status: 200
      end

      # POST /property_images
      # POST /property_images.json
      def create
        @property_image = PropertyImage.new(property_image_params)

        if @property_image.save
          render json: @property_image, status: 200
        else
          render json: @property_image.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /property_images/1
      # PATCH/PUT /property_images/1.json
      def update
        if @property_image.update(property_image_params)
          render json: @property_image, status: 200
        else
          render json: @property_image.errors, status: :unprocessable_entity
        end
      end

      # DELETE /property_images/1
      # DELETE /property_images/1.json
      def destroy
        if @property_image
          @property_image.destroy!
          render json: { message: "Property Image with Id: #{@property_image.id} that belongs to #{@property_image.property.owner.name}, was successfully deleted" }, status: 200
        else
          render json: @property_image.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_property_image
        @property_image = PropertyImage.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def property_image_params
        params.require(:property_image).permit(:image, :property_id)
      end

    end
  end
end