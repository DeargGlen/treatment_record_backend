class MedicineEntry < ApplicationRecord
    belongs_to :treatment
    belongs_to :medicine_tag
end
