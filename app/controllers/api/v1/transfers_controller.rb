module Api
  module V1
    class TransfersController < ApplicationController
      before_action :authenticate_api_v1_user!

      include ActionController::MimeResponds
      def index
        @transfers = Transfer.all

        respond_to do |format|
          format.json
        end
      end

      def show
        @transfer = Transfer.find_by(id: params[:id])
        @transfer_entries = @transfer.transfer_entries
        respond_to do |format|
          format.json
        end
      end

      def create
        @treatment = current_api_v1_user.treatments.build(treatment_params)

        if @treatment.save
          render json: {
            treatment: @treatment,
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      def destroy
        @treatment = Treatment.find(params[:id])
        if @treatment.destroy
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
