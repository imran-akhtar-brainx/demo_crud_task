class Candidate < ApplicationRecord
    belongs_to :hiring_position
    has_one_attached :image
end
