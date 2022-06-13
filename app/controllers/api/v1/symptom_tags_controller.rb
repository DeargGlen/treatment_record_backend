module Api
  module V1
    class SymptomTagsController < ApplicationController
      include ActionController::MimeResponds
      before_action :authenticate_api_v1_user!
      def index
        @symptom_tags = SymptomTag.all

        respond_to do |format|
          format.json
        end
      end

      def create
        @tag = SymptomTag.new(symptom_tag_params)

        if @tag.save
          render json: {
            barn: @tag
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      def destroy
        @tag = SymptomTag.find(params[:id])
        if @tag.destroy
          render json: {
            status: "SUCCESS"
          }
        else
          render json: {}, status: :internal_server_error
        end
      end

      private

        def symptom_tag_params
          params.require(:symptom_tag).permit(:name)
        end
    end
  end
end
