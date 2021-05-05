class ToppagesController < ApplicationController
  before_action :age
  
  def index
    all_posts = Post.all
    
    if @down_age.present?
      all_posts = all_posts.where("age >= ?", @down_age)
    end
    if @up_age.present?
      all_posts = all_posts.where("age <= ?", @up_age)
    end
    
    if params[:keyword].present?
      all_posts = all_posts.where("content LIKE ?", "%#{params[:keyword]}%")
    end
    
    @all_posts = all_posts.order(id: :desc).page(params[:page]).per(10)
  end
  
  def skin
    skin_posts = Post.where(category: "スキンケア")
    
    if @down_age.present?
      skin_posts = skin_posts.where("age >= ?", @down_age)
    end
    if @up_age.present?
      skin_posts = skin_posts.where("age <= ?", @up_age)
    end
    
    if params[:keyword].present?
      skin_posts = skin_posts.where("content LIKE ?", "%#{params[:keyword]}%")
    end
    
    @skin_posts = skin_posts.order(id: :desc).page(params[:page]).per(10)
  end
  
  def make
    make_posts = Post.where(category: "メイク")
    
    if @down_age.present?
      make_posts = make_posts.where("age >= ?", @down_age)
    end
    if @up_age.present?
      make_posts = make_posts.where("age <= ?", @up_age)
    end
    
    if params[:keyword].present?
      make_posts = make_posts.where("content LIKE ?", "%#{params[:keyword]}%")
    end
    
    @make_posts = make_posts.order(id: :desc).page(params[:page]).per(10)
  end
  
  def hair
    hair_posts = Post.where(category: "ヘアー")
    
    if @down_age.present?
      hair_posts = hair_posts.where("age >= ?", @down_age)
    end
    if @up_age.present?
      hair_posts = hair_posts.where("age <= ?", @up_age)
    end
    
    if params[:keyword].present?
      hair_posts = hair_posts.where("content LIKE ?", "%#{params[:keyword]}%")
    end
    
    @hair_posts = hair_posts.order(id: :desc).page(params[:page]).per(10)
  end
  
  def others
    others_posts = Post.where(category: "その他")
    
    if @down_age.present?
      others_posts = others_posts.where("age >= ?", @down_age)
    end
    if @up_age.present?
      others_posts = others_posts.where("age <= ?", @up_age)
    end
    
    if params[:keyword].present?
      others_posts = others_posts.where("content LIKE ?", "%#{params[:keyword]}%")
    end
    
    @others_posts = others_posts.order(id: :desc).page(params[:page]).per(10)
  end
  
  private
  
  def age
    if params[:age].present?
      if params[:age] == "-19"
        @up_age = 19
      elsif params[:age] == "20-24"
        @down_age = 20
        @up_age = 24
      elsif params[:age] == "25-29"
        @down_age = 25
        @up_age = 29
      elsif params[:age] == "30-34"
        @down_age = 30
        @up_age = 34
      elsif params[:age] == "35-39"
        @down_age = 35
        @up_age = 39
      else
        @down_age = 40
      end
    end
  end
end