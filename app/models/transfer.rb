class Transfer < ApplicationRecord
  has_many :transfer_entries, dependent: :destroy
end
