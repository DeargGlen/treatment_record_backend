json.extract! treatment, :id, :datetime,:individual_id, :body_temperature, :symptom, :content, :user_id, :user_name

symptom_entries =treatment.symptom_entries.left_outer_joins(:symptom_tag).select('symptom_entries. *, symptom_tags.*')
disease_entries =treatment.disease_entries.left_outer_joins(:disease_tag).select('disease_entries. *, disease_tags.*')

json.symptom_tags do
  json.array! symptom_entries, partial: 'symptom_entries/symptom_entry', as: :symptom_entry
end

json.disease_tags do
  json.array! disease_entries, partial: 'disease_entries/disease_entry', as: :disease_entry
end

json.extract! treatment.treat_check_table, :stool, :cough, :nose, :feed, :condition

