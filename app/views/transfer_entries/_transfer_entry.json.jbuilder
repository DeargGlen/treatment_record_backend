json.extract! transfer_entry, :id, :individual_id, :prev_block_id, :after_block_id

json.prev_area_name transfer_entry.prev_barn.area.name
json.prev_barn_name transfer_entry.prev_barn.name
json.prev_block_no transfer_entry.prev_block.No

json.after_area_name transfer_entry.after_barn.area.name
json.after_barn_name transfer_entry.after_barn.name
json.after_block_no transfer_entry.after_block.No
