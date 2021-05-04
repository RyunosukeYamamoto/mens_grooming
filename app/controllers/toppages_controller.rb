class ToppagesController < ApplicationController
  
  def skin
    skin_posts = Post.where(category: "肌(メイク以外)")
    
    if params[:age].present?
      skin_posts = skin_posts.where(age: params[:age])
    end
    
    if params[:keyword].present?
      skin_posts = skin_posts.where("content LIKE ?", "%#{params[:keyword]}%")
    end
    
    @skin_posts = skin_posts.order(id: :desc).page(params[:page]).per(2)
  end
  
  def make
    make_posts = Post.where(category: "メイク")
    
    if params[:age].present?
      make_posts = make_posts.where(age: params[:age])
    end
    
    if params[:keyword].present?
      make_posts = make_posts.where("content LIKE ?", "%#{params[:keyword]}%")
    end
    
    @make_posts = make_posts.order(id: :desc).page(params[:page]).per(2)
  end
  
  def hair
    hair_posts = Post.where(category: "ヘアー")
    
    if params[:age].present?
      hair_posts = hair_posts.where(age: params[:age])
    end
    
    if params[:keyword].present?
      hair_posts = hair_posts.where("content LIKE ?", "%#{params[:keyword]}%")
    end
    
    @hair_posts = hair_posts.order(id: :desc).page(params[:page]).per(2)
  end
  
  def others
    others_posts = Post.where(category: "その他")
    
    if params[:age].present?
      others_posts = others_posts.where(age: params[:age])
    end
    
    if params[:keyword].present?
      others_posts = others_posts.where("content LIKE ?", "%#{params[:keyword]}%")
    end
    
    @others_posts = others_posts.order(id: :desc).page(params[:page]).per(2)
  end
end