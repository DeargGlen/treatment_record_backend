json.extract! transfer, :id, :date, :completed
transfer_entries = transfer.transfer_entries

json.transfer_entries do
  json.array! transfer_entries, partial: 'transfer_entries/transfer_entry', as: :transfer_entry
end
