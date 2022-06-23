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
        @medicine_entries = @treatment.medicine_entries.left_outer_joins(:medicine_tag).select('medicine_entries. *, medicine_tags.*')
        @treat_check_table =@treatment.treat_check_table

        respond_to do |format|
          format.json
        end
      end

      def create
        @treatment = current_api_v1_user.treatments.build(treatment_params)
        @symptom_tags = params[:symptom_tags]
        @disease_tags = params[:disease_tags]
        @medicine_tags = params[:medicine_tags]
        @amount_entries = params[:amount_entries]
        @type_entries = params[:type_entries]
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

        @medicine_tags.zip(@amount_entries, @type_entries) do |tag_id, amount, amount_type|
          @medicine_entry = @treatment.medicine_entries.build({medicine_tag_id: tag_id, amount: amount, amount_type: amount_type})
          @medicine_entry.save
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

      def update
        @treatment = Treatment.find(params[:id])
        @treatment.update(treatment_params)
        @treat_check_table = @treatment.treat_check_table.update(nose: params[:nose], feed: params[:feed],  cough: params[:cough],stool: params[:stool], condition: params[:condition])

        symptom_tags = params[:symptom_tags]
        disease_tags = params[:disease_tags]
        medicine_tags = params[:medicine_tags]
        amount_entries = params[:amount_entries]
        type_entries = params[:type_entries]

        @symptom_tag_entries = @treatment.symptom_entries
        @disease_tag_entries = @treatment.disease_entries
        @medicine_tag_entries = @treatment.medicine_entries

        @medicine_tag_entries.each do |tag_entry|
          if !medicine_tags.include?(tag_entry.medicine_tag_id)
            tag_entry.destroy
          end
        end
        
        medicine_tags.zip(amount_entries, type_entries) do |tag_id, amount, amount_type|
          if @medicine_tag_entries.find_by(medicine_tag_id: tag_id).nil?
            @new_medicine_tag_entry = @treatment.medicine_entries.build({medicine_tag_id: tag_id, amount: amount, amount_type: amount_type})
            @new_medicine_tag_entry.save
          end
        end

        @symptom_tag_entries.each do |tag_entry|
          if !symptom_tags.include?(tag_entry.symptom_tag_id)
            tag_entry.destroy
          end
        end

        symptom_tags.each do |tag_id|
          if @symptom_tag_entries.find_by(symptom_tag_id: tag_id).nil?
            @new_symptom_tag_entry = @treatment.symptom_entries.build({symptom_tag_id: tag_id})
            @new_symptom_tag_entry.save
          end
        end

        @disease_tag_entries.each do |tag_entry|
          if !disease_tags.include?(tag_entry.disease_tag_id)
            tag_entry.destroy
          end
        end
        
        disease_tags.each do |tag_id|
          if @disease_tag_entries.find_by(disease_tag_id: tag_id).nil?
            @new_disease_tag_entry = @treatment.disease_entries.build({disease_tag_id: tag_id})
            @new_disease_tag_entry.save
          end
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

        def treat_check_table_params
          params.require(:treat_check_table).permit(:nose, :cough, :conditon, :feed, :stool)
        end
    end
  end
end
