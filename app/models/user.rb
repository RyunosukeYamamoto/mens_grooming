class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :age, allow_blank: true, numericality: {only_integer: true}, length: { in: 1..3 }
  has_secure_password
  
  has_many :posts
  has_many :favorites
  has_many :favo_posts, through: :favorites, source: :post
  
  def favo(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end
  
  def unfavo(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
  
  def favo?(post)
    self.favo_posts.include?(post)
  end
end
