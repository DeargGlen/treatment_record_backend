json.treatments do
  json.array! @treatments, partial: 'treatments/treatment', as: :treatment
end
