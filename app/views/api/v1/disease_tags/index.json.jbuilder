json.disease_tags do
  json.array! @disease_tags, partial: 'disease_tags/disease_tag', as: :disease_tag
end
