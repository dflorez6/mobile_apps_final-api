module Api
  module V1
    class ApplicationsController < ApplicationController
      before_action :set_application, only: %i[ show update destroy ]

      # GET /applications
      # GET /applications.json
      def index
        @applications = Application.all
        render json: @applications, status: 200
      end

      # GET /applications/1
      # GET /applications/1.json
      def show
        render json: @application, status: 200
      end

      # POST /applications
      # POST /applications.json
      def create
        @application = Application.new(application_params)

        if @application.save
          render json: @application, status: 200
        else
          render json: @application.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /applications/1
      # PATCH/PUT /applications/1.json
      def update
        if @application.update(application_params)
          render json: @application, status: 200
        else
          render json: @application.errors, status: :unprocessable_entity
        end
      end

      # DELETE /applications/1
      # DELETE /applications/1.json
      def destroy
        if @application
          @application.destroy!
          render json: { message: "Application successfully deleted" }, status: 200
        else
          render json: @application.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_application
        @application = Application.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def application_params
        params.require(:application).permit(:property_id, :prospect_id, :application_date)
      end

    end
  end
end