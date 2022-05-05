class Individual < ApplicationRecord
    has_many :treatments
    belongs_to :block
    has_one :barn, through: :block

    default_scope -> { order(created_at: :desc)}

    #正規表現
    VALID_ID = /\A(\d{10})?\z/
    VALID_ONE_DIGIT = /\A\d{1}\z/

    #個体識別番号番号は10桁の数字
    validates :id, presence: true, format: { with: VALID_ID }
    #validates :mother_id, format: { with: VALID_ID }


    validates :sex, presence: true
    validates :category, presence: true
    validates :breed_type, presence: true

    enum sex: {neutered: 0, male: 1, felmale: 2 }
    enum category: {feedlot: 0, breeding: 1, suckling: 2 , calf: 3}
    enum breed_type: {black: 0, F1: 1}

end