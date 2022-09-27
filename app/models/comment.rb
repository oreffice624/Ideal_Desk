class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  #バリデーション
  validates :content, presence: true
end
