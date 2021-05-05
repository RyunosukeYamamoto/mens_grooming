class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :category, presence: true, length: { maximum:50 }
  
  has_many :relationships, dependent: :destroy
  has_many :troubles, through: :relationships, source: :trouble
  
  has_many :favorites, dependent: :destroy
  has_many :favo_users, through: :favorites, source: :user
  
  def add_trouble(trouble)
    self.relationships.find_or_create_by(trouble_id: trouble.id)
  end
  
  def delete_trouble(trouble)
    relationship = self.relationships.find_by(trouble_id: trouble.id)
    relationship.destroy if relationship
  end
  
  def include_trouble?(trouble)
    self.troubles.include?(trouble)
  end
end
