json.extract! @transfer,
              :id,
              :date,
              :completed,

json.transfer_entries do
  json.array! @transfer_entries, partial: 'transfer_entries/transfer_entry', as: :transfer_entry
end
