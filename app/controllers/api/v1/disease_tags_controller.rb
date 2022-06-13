module Api
  module V1
    class DiseaseTagsController < ApplicationController
      include ActionController::MimeResponds
      before_action :authenticate_api_v1_user!
      def index
        @disease_tags = DiseaseTag.all

        respond_to do |format|
          format.json
        end
      end

      def create
        @tag = DiseaseTag.new(disease_tag_params)

        if @tag.save
          render json: {
            barn: @tag
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      def destroy
        @tag = DiseaseTag.find(params[:id])
        if @tag.destroy
          render json: {
            status: "SUCCESS"
          }
        else
          render json: {}, status: :internal_server_error
        end
      end

      private

        def disease_tag_params
          params.require(:disease_tag).permit(:name)
        end
    end
  end
end
