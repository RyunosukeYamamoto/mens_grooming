class PostsController < ApplicationController
  before_action :require_user_logged_in, except: [:show]
  before_action :correct_user, only: [:destroy]
  
  def show
  end

  def new
    @post = current_user.posts.build  # form_with 用
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      flash.now[:danger] = "失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post.destroy
    flash[:success] = "メッセージを削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content, :category, :age)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
