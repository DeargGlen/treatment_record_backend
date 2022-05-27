module Api
  module V1
    class BlocksController < ApplicationController
      include ActionController::MimeResponds
      before_action :authenticate_api_v1_user!
      def destroy
        @block = Block.find(params[:id])
        if @block.destroy
          render json: {
            status: "SUCCESS"
          }
        else
          render json: {}, status: :internal_server_error
        end
      end

      def create
        @block = Barn.find(params[:barn_id]).blocks.build(No: params[:no])

        if @block.save
          render json: {
            block: @block
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end
    end
  end
end
