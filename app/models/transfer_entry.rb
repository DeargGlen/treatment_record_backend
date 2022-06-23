class TransferEntry < ApplicationRecord
  belongs_to :transfer
  belongs_to :individual
  belongs_to :prev_block, class_name: "Block"
  belongs_to :after_block, class_name: "Block"
  has_one :prev_barn, through: :prev_block, source: :barn
  has_one :after_barn, through: :after_block, source: :barn

end
