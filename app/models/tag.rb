class Tag < ApplicationRecord
  # has_many :desk_tags, dependent: :destroy
  # has_many :desks, through: :desk_tags, dependent: :destroy
  
  # has_many :desks, through: :desk_tag
  # has_many :desk_tag 
end
