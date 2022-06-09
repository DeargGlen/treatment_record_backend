json.extract! @barn,
              :id,
              :name

json.blocks do
  json.array! @blocks, partial: 'blocks/block', as: :block
end
