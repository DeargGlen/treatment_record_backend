module Api
  module V1
    class IndividualTagsController < ApplicationController
      include ActionController::MimeResponds
      before_action :authenticate_api_v1_user!
      def index
        @individual_tags = IndividualTag.all

        respond_to do |format|
          format.json
        end
      end

      def create
        @tag = IndividualTag.new(individual_tag_params)

        if @tag.save
          render json: {
            barn: @tag
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      def destroy
        @tag = IndividualTag.find(params[:id])
        if @tag.destroy
          render json: {
            status: "SUCCESS"
          }
        else
          render json: {}, status: :internal_server_error
        end
      end

      private

        def individual_tag_params
          params.require(:individual_tag).permit(:name)
        end
    end
  end
end
