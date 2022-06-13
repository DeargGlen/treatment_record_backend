json.symptom_tags do
  json.array! @symptom_tags, partial: 'symptom_tags/symptom_tag', as: :symptom_tag
end
