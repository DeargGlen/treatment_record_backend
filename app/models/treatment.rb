class Treatment < ApplicationRecord
    #外部キー関連付け
    belongs_to :individual
    has_many :treat_comments
    has_many :symptom_entries
    has_many :disease_entries
    has_many :dosages
    belongs_to :user
    has_one :treat_check_table

end
