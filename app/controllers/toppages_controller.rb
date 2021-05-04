class ToppagesController < ApplicationController
  
  def index
    skin_posts = Post.where(category: "肌(メイク以外)")
    make_posts = Post.where(category: "メイク")
    hair_posts = Post.where(category: "ヘアー")
    others_posts = Post.where(category: "その他")
    
    if params[:age].present?
      skin_posts = skin_posts.where(age: params[:age])
      make_posts = make_posts.where(age: params[:age])
      hair_posts = hair_posts.where(age: params[:age])
      others_posts = others_posts.where(age: params[:age])
    end
    
    if params[:keyword].present?
      skin_posts = skin_posts.where("content LIKE ?", "%#{params[:keyword]}%")
      make_posts = make_posts.where("content LIKE ?", "%#{params[:keyword]}%")
      hair_posts = hair_posts.where("content LIKE ?", "%#{params[:keyword]}%")
      others_posts = others_posts.where("content LIKE ?", "%#{params[:keyword]}%")
    end
    
    @skin_posts = skin_posts.order(id: :desc).page(params[:page]).per(10)
    @make_posts = make_posts.order(id: :desc).page(params[:page]).per(10)
    @hair_posts = hair_posts.order(id: :desc).page(params[:page]).per(10)
    @others_posts = others_posts.order(id: :desc).page(params[:page]).per(10)
  end
end
