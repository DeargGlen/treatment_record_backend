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
        @transfer = Transfer.new(transfer_params)
        @individual_entries = params[:individual_entries]
        @prev_block_id_entries = params[:prev_block_id_entries]
        @after_block_id_entries = params[:after_block_id_entries]

        @individual_entries.zip(@prev_block_id_entries, @after_block_id_entries) do |individual_id, prev_block_id, after_block_id|
          @new_transfer_entry = @transfer.transfer_entries.build({individual_id: individual_id, prev_block_id: prev_block_id, after_block_id: after_block_id})
          @new_transfer_entry.save
        end

        if @transfer.save
          render json: {
            transfer: @transfer,
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      def update
        @transfer = Transfer.find(params[:id])
        @transfer.update(transfer_params)
      end

      def destroy
        @transfer = Transfer.find(params[:id])
        @transfer.destroy
      end

      private

        def transfer_params
          params.require(:transfer).permit(:date, :completed)
        end
    end
  end
end
