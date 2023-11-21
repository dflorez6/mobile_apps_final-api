module Api
  module V1
    class CountriesController < ApplicationController
      before_action :set_country, only: %i[ show update destroy ]

      # GET /countries
      # GET /countries.json
      def index
        @countries = Country.all
        render json: @countries, status: 200
      end

      # GET /countries/1
      # GET /countries/1.json
      def show
        render json: @country, status: 200
      end

      # POST /countries
      # POST /countries.json
      def create
        @country = Country.new(country_params)

        if @country.save
          # Original Code, keeping it for reference
          # render :show, status: :created, location: api_v1_countries_url(@country) # make sure to update to api_v1_URL(@model)
          render json: @country, status: 200
        else
          render json: @country.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /countries/1
      # PATCH/PUT /countries/1.json
      def update
        if @country.update(country_params)
          render json: @country, status: 200
        else
          render json: @country.errors, status: :unprocessable_entity
        end
      end

      # DELETE /countries/1
      # DELETE /countries/1.json
      def destroy
        if @country
          @country.destroy!
          render json: { message: "Country successfully deleted" }, status: 200
        else
          render json: @country.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_country
        @country = Country.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def country_params
        params.require(:country).permit(:name_en)
      end

    end
  end
end