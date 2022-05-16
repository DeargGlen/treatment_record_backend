module Api
  module V1
    class IndividualsController < ApplicationController
      before_action :authenticate_api_v1_user!
      include ActionController::MimeResponds
      def index
        @individuals = Individual.all
        @d2=Date.today

        respond_to do |format|
          format.json
        end
      end

      def show
        @individual = Individual.find_by(id: params[:id])
        @treatments = @individual.treatments.left_outer_joins(:user).select('treatments.*,user_id as user_id, name as user_name')
        @d2=Date.today

        respond_to do |format|
          format.json
        end
      end

      def create
        @individual = Individual.new(individual_params)

        if @individual.save
          render json: {
            individual: @individual
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end

      end

      private

        def individual_params
          params.require(:individual).permit(:id, :date_of_birth, :sex, :category, :breed_type, :mother_id, :father_name, :grandfather_namme, :date_of_introduction, :block_id)
        end
    end
  end
end
