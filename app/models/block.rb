class Block < ApplicationRecord
    belongs_to :barn
    has_many :individuals
    has_many :transfer_entries, class_name: "TransferEtry", foreign_key: "prev_block_id", dependent: :destroy
    has_many :transfer_entries, class_name: "TransferEtry", foreign_key: "after_block_id", dependent: :destroy

    validates :No, presence: true

end
