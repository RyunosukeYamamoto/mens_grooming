class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page]).per(10)
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end
  
  def update
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_url
    end
    if @user.update(user_params)
      flash[:success] = 'プロフィールを変更しました'
    else
      flash[:danger] = 'プロフィールの変更に失敗しました'
    end
    redirect_to @user
  end
  
  def favorite
    @user = User.find(params[:id])
    @posts = @user.favo_posts.order(id: :desc).page(params[:page]).per(10)
    counts(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age)
  end
end
