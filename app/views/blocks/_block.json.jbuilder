json.extract! block, :id, :No
json.individuals block.individuals do |individual|
  json.id individual.id
  json.date_of_birth individual.date_of_birth
  json.sex individual.sex
  json.category individual.category
  json.breed_type individual.breed_type
  json.date_of_introduction individual.date_of_introduction
  json.mother_id individual.mother_id
  json.father_name individual.father_name
  json.grandfather_name individual.grandfather_name
  months =
    (@d2.year - individual.date_of_birth.year) * 12 + @d2.month -
      individual.date_of_birth.month +
      ((@d2.day - individual.date_of_birth.day).to_f / 30)
  json.age months.round(1)
end
