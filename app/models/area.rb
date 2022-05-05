class Area < ApplicationRecord
    has_many :barns

    validates :name, presence: true
end
