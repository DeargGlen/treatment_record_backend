class Dosage < ApplicationRecord
    belongs_to :treatment
    belongs_to :medicine
end
