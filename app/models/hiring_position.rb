class HiringPosition < ApplicationRecord
    has_many :candidates, dependent: :destroy
    validates :name, presence: true
    has_one_attached :image
end
