class Review < ApplicationRecord
  belongs_to :user
  belongs_to :desk
  has_many :comments, dependent: :destroy
  validates :score, presence: true
end
