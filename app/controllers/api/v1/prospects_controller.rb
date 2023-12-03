module Api
  module V1
    class ProspectsController < ApplicationController
      before_action :set_prospect, only: %i[ show update destroy ]

      # GET /prospects
      # GET /prospects.json
      def index
        @prospects = Prospect.all
        render json: @prospects, status: 200
      end

      # GET /prospects/1
      # GET /prospects/1.json
      def show
        render json: @prospect, status: 200
      end

      # POST /prospects
      # POST /prospects.json
      def create
        @prospect = Prospect.new(prospect_params)

        if @prospect.save
          render json: @prospect, status: 200
        else
          render json: @prospect.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /prospects/1
      # PATCH/PUT /prospects/1.json
      def update
        if @prospect.update(prospect_params)
          render json: @prospect, status: 200
        else
          render json: @prospect.errors, status: :unprocessable_entity
        end
      end

      # DELETE /prospects/1
      # DELETE /prospects/1.json
      def destroy
        if @prospect
          @prospect.destroy!
          render json: { message: "#{@prospect.name} successfully deleted" }, status: 200
        else
          render json: @prospect.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_prospect
        @prospect = Prospect.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def prospect_params
        params.require(:prospect).permit(
          :first_name, :last_name, :name, :email, :password, :password_confirmation, :dob, :phone, :street, :city,
          :postal_code, :province, :country, :image, :user_role
        )
      end

    end
  end
end
