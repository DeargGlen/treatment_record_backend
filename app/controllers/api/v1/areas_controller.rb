module Api
  module V1
    class AreasController < ApplicationController
      include ActionController::MimeResponds
      before_action :authenticate_api_v1_user!
      def index
        @areas = Area.all

        respond_to do |format|
          format.json
        end
      end

      def create
        @area = Area.new(area_params)

        if @area.save
          render json: {
            area: @area
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      def destroy
        @area = Area.find(params[:id])
        if @area.destroy
          render json: {
            status: "SUCCESS"
          }
        else
          render json: {}, status: :internal_server_error
        end
      end

      private

        def area_params
          params.require(:area).permit(:name)
        end
    end
  end
end
