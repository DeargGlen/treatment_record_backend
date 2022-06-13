class TreatComment < ApplicationRecord
    belongs_to :treatment
    belongs_to :user
    has_one :individual, through: :treatment
end
