class DiseaseEntry < ApplicationRecord
  belongs_to :treatment
  belongs_to :disease_tag
end
