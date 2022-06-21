class TransferEntry < ApplicationRecord
  belongs_to :transfer
  belongs_to :individual
  belongs_to :prev_block, class_name: "Block"
  belongs_to :after_block, class_name: "Block"
end
