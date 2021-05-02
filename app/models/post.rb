class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :category, presence: true, length: { maximum:50 }
end
