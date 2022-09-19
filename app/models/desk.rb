class Desk < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  has_one_attached :profile_image

  has_many :desk_tags, dependent: :destroy
  has_many :tags, through: :desk_tags

    with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
end
