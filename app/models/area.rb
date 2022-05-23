class Area < ApplicationRecord
    has_many :barns, dependent: :destroy

    validates :name, presence: true
end
