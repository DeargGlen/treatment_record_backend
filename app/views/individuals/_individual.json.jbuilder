json.extract! individual, :id, :date_of_birth, :sex, :category, :breed_type, :date_of_introduction, :block_id
json.extract! individual.barn, :name
json.extract! individual.block, :No
months = (@d2.year - individual.date_of_birth.year) * 12 + @d2.month - individual.date_of_birth.month - (@d2.day >= individual.date_of_birth.day ? 0 : 1)
json.age months

