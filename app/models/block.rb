class Block < ApplicationRecord
    belongs_to :barn
    has_many :individuals

    validates :No, presence: true

end
