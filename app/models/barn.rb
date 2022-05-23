class Barn < ApplicationRecord
    belongs_to :area
    has_many :blocks, dependent: :destroy

    validates :name, presence: true
end
