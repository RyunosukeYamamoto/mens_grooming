class RelationshipsController < ApplicationController
  before_action :require_user_logged_in, :search_post
  def create
    trouble = Trouble.find(params[:trouble_id])
    @post.add_trouble(trouble)
    flash[:success] = "悩みを投稿に紐付けました"
    redirect_to @post
  end

  def destroy
    trouble = Trouble.find(params[:trouble_id])
    @post.delete_trouble(trouble)
    flash[:success] = "悩みの紐付けを解除しました"
    redirect_to @post
  end
  
  private
  
  def search_post
    @post = current_user.posts.find_by(id: params[:post_id])
    unless @post
      redirect_to root_url
    end
  end
end
