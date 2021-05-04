class Trouble < ApplicationRecord
  validates :word, presence: true, length: { maximum:50 }, uniqueness: { case_sensitive: false }
  
  has_many :relationships
  has_many :posts, through: :relationships, source: :post
end
