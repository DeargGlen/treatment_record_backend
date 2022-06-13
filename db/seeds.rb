# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Area.create(id: 1, name:'本場')
Barn.create(id:1, name:'家の前', area_id:1)
Block.create(id:1, No:'北1', barn_id: 1)
