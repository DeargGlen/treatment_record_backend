json.individual_tags do
  json.array! @individual_tags, partial: 'individual_tags/individual_tag', as: :individual_tag
end
