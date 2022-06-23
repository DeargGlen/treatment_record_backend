module Api
  module V1
    class BarnsController < ApplicationController
      include ActionController::MimeResponds
      before_action :authenticate_api_v1_user!
      def show
        @barn = Barn.find_by(id: params[:id])
        @blocks = @barn.blocks
        @d2=Date.today

        respond_to do |format|
          format.json
        end
      end

      def create
        @barn = Area.find(params[:area_id]).barns.build(name: params[:name])

        if @barn.save
          render json: {
            barn: @barn
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      def destroy
        @barn = Barn.find(params[:id])
        if @barn.destroy
          render json: {
            status: "SUCCESS"
          }
        else
          render json: {}, status: :internal_server_error
        end
      end

    end
  end
end
