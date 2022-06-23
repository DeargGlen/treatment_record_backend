module Api
  module V1
    class MedicineTagsController < ApplicationController
      include ActionController::MimeResponds
      before_action :authenticate_api_v1_user!
      def index
        @medicine_tags = MedicineTag.all

        respond_to do |format|
          format.json
        end
      end

      def create
        @tag = MedicineTag.new(medicine_tag_params)

        if @tag.save
          render json: {
            barn: @tag
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      def destroy
        @tag = MedicineTag.find(params[:id])
        if @tag.destroy
          render json: {
            status: "SUCCESS"
          }
        else
          render json: {}, status: :internal_server_error
        end
      end

      private

        def medicine_tag_params
          params.require(:medicine_tag).permit(:name, :type)
        end
    end
  end
end
