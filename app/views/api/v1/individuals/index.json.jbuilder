json.individuals do
  json.array! @individuals, partial: 'individuals/individual', as: :individual
end

