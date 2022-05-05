class Treatment < ApplicationRecord
    #外部キー関連付け
    belongs_to :individual
    has_many :treat_comments
    has_many :symptom_entries
    has_many :dosages
    belongs_to :user

    validates :gotDosage, inclusion: { in: [true, false]}
end