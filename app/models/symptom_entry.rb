class SymptomEntry < ApplicationRecord
    belongs_to :symptom_tag
    belongs_to :treatment
end
