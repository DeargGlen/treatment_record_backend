json.extract! individual,
              :id,
              :date_of_birth,
              :sex,
              :category,
              :breed_type,
              :date_of_introduction,
              :block_id,
              :mother_id,
              :father_name,
              :grandfather_name
json.barn_name individual.barn.name
json.extract! individual.block, :No
json.area_name individual.barn.area.name
months =
  (@d2.year - individual.date_of_birth.year) * 12 + @d2.month -
    individual.date_of_birth.month +
    ((@d2.day - individual.date_of_birth.day).to_f / 30)
json.age months.round(1)
