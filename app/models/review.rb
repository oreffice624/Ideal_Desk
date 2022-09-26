class Review < ApplicationRecord
  belongs_to :user
  belongs_to :desk
  validates :score, presence: true
end
