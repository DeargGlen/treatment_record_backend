# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name:"DeargGlen", email:"deargglen@example.com", password:"password", admin: true)
15.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@example.com"
    password = "password"
    User.create!(name: name, email: email, password: password, password_confirmation: password)
end

Area.create(name:"本場")
Barn.create(name:"家の前", area_id:1)
Block.create(No:"北1", barn_id:1)
Individual.create(id:"1000010010", date_of_birth:"2022-02-20", sex:0, category:0, breed_type:0, date_of_introduction:"2022-02-20", block_id:1)
Individual.create(id:"1000010020", date_of_birth:"2022-02-20", sex:1, category:1, breed_type:1, date_of_introduction:"2022-02-20", block_id:1)
90.times do |n|
    id = Faker::Number.number(digits:10).to_s
    date_of_birth = Date.today.last_year.days_ago(n)
    sex = 0
    category = 0
    breed_type = 0
    date_of_introduction = Date.today
    block_id = 1
    Individual.create!(id: id, date_of_birth: date_of_birth, sex: sex, category: category, breed_type: breed_type, date_of_introduction: date_of_introduction, block_id: block_id)
end

Treatment.create(individual_id:"1000010010", datetime:"2022-02-20 8:00:00 +0900", body_temperature:38.8, symptom:"症状のメモ", content:"治療内容", gotDosage:false, user_id:1)
individuals = Individual.order(:id).take(6)
25.times do
    datetime = Time.zone.now
    body_temperature = 38.0
    symptom="メモ"
    content="内容"
    gotDosage=false
    user_id=Faker::Number.number(digits:2) % 15 + 1
    individuals.each { |individual| individual.treatments.create!(datetime: datetime, body_temperature: body_temperature, symptom: symptom, content: content, gotDosage: gotDosage, user_id: user_id)}
end

SymptomTag.create(name:"症状1")
SymptomEntry.create(treatment_id:1, symptom_tag_id:1)
Medicine.create(name:"薬1", description:"説明")
Dosage.create(treatment_id:1, medicine_id:1, amount:0.2)
TreatComment.create(treatment_id:1, content:"コメントの内容", user_id:1)
