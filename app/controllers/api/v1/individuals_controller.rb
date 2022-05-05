module Api
  module V1
    class IndividualsController < ApplicationController
      def index
        individuals = Individual.all

        render json: {
          individuals: individuals
        }, status: :ok
      end

      def show
        individual = Individual.find_by(id: params[:id])
        treatments = individual.treatments

        render json: {
          individual: individual,
          treatments: treatments
        }, status: :ok
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
          params.require(:individual).permit(:id, :date_of_birth, :sex, :category, :breed_type, :date_of_introduction, :block_id)
        end
    end
  end
end
