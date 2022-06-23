module Api
  module V1
    class TreatCommentsController < ApplicationController
      before_action :authenticate_api_v1_user!
      include ActionController::MimeResponds
      def index
        @treat_comments = TreatComment.order("created_at DESC").limit(10).left_outer_joins(:user).select('treat_comments.*, name as user_name').left_outer_joins(:treatment).select('treat_comments.*,treatment_id as treatment_id').left_outer_joins(:individual).select('treat_comments.*,individual_id as individual_id')

        respond_to do |format|
          format.json
        end
      end

      def create
        @comment = current_api_v1_user.treat_comments.build(comment_params)

        if @comment.save
          render json: {
            treatment: @comment
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      def destroy
        @comment = TreatComment.find(params[:id])
        @comment.destroy
      end

      private

        def comment_params
          params.require(:treat_comment).permit(:treatment_id, :content, :user_id)
        end
    end
  end
end
