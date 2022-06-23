# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Area.create(id: 1, name:'本場')
Barn.create(id:1, name:'家の前', area_id:1)
Barn.create(id:2, name:'北の牛舎', area_id:1)
Block.create(id:1, No:'北1', barn_id: 1)
Block.create(id:2, No:'南1', barn_id: 2)
Individual.create(id:'1111111111', date_of_birth:'2022-06-16', sex:0, category:0, breed_type:0, block_id:1 )
Individual.create(id:'1111111121', date_of_birth:'2022-06-10', sex:1, category:1, breed_type:1, block_id:2 )
Individual.create(id:'1111111131', date_of_birth:'2022-05-10', sex:1, category:1, breed_type:1, block_id:2 )
Transfer.create(completed: false, date:'2022-06-21')
Transfer.create(completed: true, date:'2022-06-10')
Transfer.create(completed: true, date:'2022-05-10')
TransferEntry.create(transfer_id: 1, individual_id: '1111111111', prev_block_id:1, after_block_id:2)
TransferEntry.create(transfer_id: 2, individual_id: '1111111121', prev_block_id:2, after_block_id:1)
TransferEntry.create(transfer_id: 3, individual_id: '1111111131', prev_block_id:2, after_block_id:1)

