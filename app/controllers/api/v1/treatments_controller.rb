module Api
  module V1
    class TreatmentsController < ApplicationController
      before_action :authenticate_api_v1_user!

      include ActionController::MimeResponds
      def index
        @treatments = Treatment.left_outer_joins(:user).select('treatments.*,user_id as user_id, name as user_name')

        respond_to do |format|
          format.json
        end
      end

      def create
        @treatment = current_api_v1_user.treatments.build(treatment_params)

        if @treatment.save
          render json: {
            treatment: @treatment
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      private

        def treatment_params
          params.require(:treatment).permit(:individual_id, :datetime, :body_temperature, :symptom, :content, :user_id)
        end
    end
  end
end
