module Api
  module V1
    class IndividualsController < ApplicationController
      before_action :authenticate_api_v1_user!
      include ActionController::MimeResponds
      def index
        only_unshipped = params[:unshipped]
        only_shipped = params[:shipped]
        if only_unshipped == "true"
          @individuals = Individual.where(shipped: false)
        elsif only_shipped == 'true'
          @individuals = Individual.where(shipped: true)
        else
          @individuals = Individual.all
        end
        @d2=Date.today

        respond_to do |format|
          format.json
        end
      end

      def show
        @individual = Individual.find_by(id: params[:id])
        @treatments = @individual.treatments.left_outer_joins(:user).select('treatments.*,user_id as user_id, name as user_name')
        @d2=Date.today
        @individual_tag_entries = @individual.individual_tag_entries.left_outer_joins(:individual_tag).select('individual_tag_entries. *, individual_tags.*')

        respond_to do |format|
          format.json
        end
      end

      def create
        @individual = Individual.new(individual_params)
        @individual_tags = params[:individual_tags]

        @individual_tags.each do |tag_id|
          @individual_tag_entry = @individual.individual_tag_entries.build({individual_tag_id: tag_id})
          @individual_tag_entry.save
        end

        if @individual.save
          render json: {
            individual: @individual
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end

      end

      def destroy
        @individual = Individual.find(params[:id])
        if @individual.destroy
          render json: {
            status: "SUCCESS"
          }
        else
          render json: {}, status: :internal_server_error
        end
      end

      def update
        @individual = Individual.find(params[:id])
        @individual.update(individual_params)

        individual_tags = params[:individual_tags]

        @individual_tag_entries = @individual.individual_tag_entries

        if @individual_tag_entries.present?
          @individual_tag_entries.each do |tag_entry|
            if !individual_tags.include?(tag_entry.individual_tag_id)
              tag_entry.destroy
            end
          end
        end

        if individual_tags.present? 
          individual_tags.each do |tag_id|
            if @individual_tag_entries.find_by(individual_tag_id: tag_id).nil?
              @new_individual_tag_entry = @individual.individual_tag_entries.build({individual_tag_id: tag_id})
              @new_individual_tag_entry.save
            end
          end
        end

      end


      private

        def individual_params
          params.require(:individual).permit(:id, :date_of_birth, :sex, :category, :breed_type, :mother_id, :father_name, :grandfather_name, :grand_grandfather_name, :date_of_introduction, :block_id)
        end
    end
  end
end
