class Barn < ApplicationRecord
    belongs_to :area
    has_many :blocks

    validates :name, presence: true
end
