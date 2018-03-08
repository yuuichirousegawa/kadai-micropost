class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :followings, :followers]
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @microposts= @user.microposts.order('created_at DESC').page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def followings
    @user=User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user=User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = '更新に成功しました'
      redirect_to @user
    else
      render :edit
    end
  end
    
    
  private
  
  def set_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :birth)
  end
end