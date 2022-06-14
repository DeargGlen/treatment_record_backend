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

      def show
        @treatment = Treatment.left_outer_joins(:user).select('treatments.*,user_id as user_id, name as user_name').find_by(id: params[:id])
        @treat_comments = @treatment.treat_comments.left_outer_joins(:user).select('treat_comments.*, name as user_name').left_outer_joins(:individual).select('treat_comments.*,individual_id as individual_id')
        @symptom_entries = @treatment.symptom_entries.left_outer_joins(:symptom_tag).select('symptom_entries. *, symptom_tags.*')
        @disease_entries = @treatment.disease_entries.left_outer_joins(:disease_tag).select('disease_entries. *, disease_tags.*')
        @treat_check_table =@treatment.treat_check_table

        respond_to do |format|
          format.json
        end
      end

      def create
        @treatment = current_api_v1_user.treatments.build(treatment_params)
        @symptom_tags = params[:symptom_tags]
        @disease_tags = params[:disease_tags]
        @treat_check_table = @treatment.build_treat_check_table(nose: params[:nose], feed: params[:feed],  cough: params[:cough],stool: params[:stool], condition: params[:condition])
        @treat_check_table.save

        @symptom_tags.each do |tag_id|
          @symptom_entry = @treatment.symptom_entries.build({symptom_tag_id: tag_id})
          @symptom_entry.save
        end

        @disease_tags.each do |tag_id|
          @disease_entry = @treatment.disease_entries.build({disease_tag_id: tag_id})
          @disease_entry.save
        end

        if @treatment.save
          render json: {
            treatment: @treatment,
            treat_check_table: @treat_check_table
          }, status: :created
        else
          render json: {}, status: :internal_server_error
        end
      end

      def destroy
        @treatment = Treatment.find(params[:id])
        if @treatment.destroy
          render json: {
            status: "SUCCESS"
          }
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
