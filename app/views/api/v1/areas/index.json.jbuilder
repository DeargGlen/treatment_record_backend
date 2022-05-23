json.areas do
  json.array! @areas, partial: 'areas/area', as: :area
end
