class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Post.find(params[:post_id])
    current_user.favo(post)
    flash[:success] = 'お気に入りに登録しました'
    redirect_back(fallback_location: post)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavo(post)
    flash[:success] = 'お気に入りを解除しました'
    redirect_back(fallback_location: post)
  end
end
