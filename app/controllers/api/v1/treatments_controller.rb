module Api
  module V1
    class TreatmentsController < ApplicationController
      def index
        treatments = Treatment.all

        render json: {
          treatments: treatments
        }, status: :ok
      end

      def create
        @treatment = current_user.treatments.build(treatment_params)

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
          params.require(:treatment).permit(:individual_id, :datetime, :body_temperature, :symptom, :content, :gotDosage)
        end
    end
  end
end
