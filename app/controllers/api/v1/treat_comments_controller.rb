module Api
  module V1
    class TreatCommentsController < ApplicationController
      before_action :authenticate_api_v1_user!

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

      private

        def comment_params
          params.require(:treat_comment).permit(:treatment_id, :content, :user_id)
        end
    end
  end
end
