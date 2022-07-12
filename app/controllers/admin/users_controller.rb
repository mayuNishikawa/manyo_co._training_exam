class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]
  before_action :only_admin

  def index
    @users = User.select(:id, :name)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザー情報を更新しました"
    else
      redirect_to tasks_path
      flash[:notice] = '管理者は最低1人必要です'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
