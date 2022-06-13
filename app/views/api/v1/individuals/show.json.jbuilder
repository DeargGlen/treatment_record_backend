json.extract! @individual,
              :id,
              :date_of_birth,
              :sex,
              :category,
              :breed_type,
              :date_of_introduction,
              :block_id,
              :mother_id,
              :father_name,
              :grandfather_name,
              :grand_grandfather_name
json.barn_name @individual.barn.name
json.extract! @individual.block, :No
json.area_name @individual.barn.area.name
months =
  (@d2.year - @individual.date_of_birth.year) * 12 + @d2.month -
    @individual.date_of_birth.month -
    (@d2.day >= @individual.date_of_birth.day ? 0 : 1)

json.age months

json.age months
json.treatments do
  json.array! @treatments, partial: 'treatments/treatment', as: :treatment
end

json.individual_tags do
  json.array! @individual_tag_entries, partial: 'individual_tag_entries/individual_tag_entry', as: :individual_tag_entry
end
