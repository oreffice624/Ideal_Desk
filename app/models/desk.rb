class Desk < ApplicationRecord
  acts_as_taggable
  has_many :reviews, dependent: :destroy
  #has_many :tags, through: :desk_tag
  #has_many :desk_tag 
  belongs_to :user
  has_one_attached :image
  has_one_attached :profile_image
  


    with_options presence: true do
    validates :title
    validates :body
    validates :image
  end

  # roundメソッドが機能できない
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).to_f*100/5
    else
      0.0
    end



  end



end
