class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[ new create ]
  before_action :set_user, only: %i[ show destroy ]
  before_action :not_current_user, only: %i[ show ], unless: :ensure_admin?

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show   
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザーを削除しました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def not_current_user
    unless @user == current_user
      flash[:notice] == "他のユーザーのページにはアクセス出来ません"
      redirect_to tasks_path
    end
  end

  def ensure_admin?
    current_user.admin?
  end
end

