json.medicine_tags do
  json.array! @medicine_tags, partial: 'medicine_tags/medicine_tag', as: :medicine_tag
end
