class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new

  end

  def edit

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end