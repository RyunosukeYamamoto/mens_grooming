class PostsController < ApplicationController
  before_action :require_user_logged_in, except: [:show]
  
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
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content, :category)
  end
end
