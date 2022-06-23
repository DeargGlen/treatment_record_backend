json.transfers do
  json.array! @transfers, partial: 'transfers/transfer', as: :transfer
end
