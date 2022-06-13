json.extract! @treatment,
              :id,
              :datetime,
              :individual_id,
              :body_temperature,
              :symptom,
              :content,
              :user_name

json.treat_comments do
  json.array! @treat_comments, partial: 'treat_comments/treat_comment', as: :treat_comment
end

json.symptom_tags do
  json.array! @symptom_entries, partial: 'symptom_entries/symptom_entry', as: :symptom_entry
end

json.disease_tags do
  json.array! @disease_entries, partial: 'disease_entries/disease_entry', as: :disease_entry
end

json.extract! @treat_check_table,
              :stool,
              :feed,
              :cough,
              :condition,
              :nose
