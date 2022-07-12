class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required

  private

  def login_required
    flash[:notice] == "ログインしてください"
    redirect_to new_session_path unless current_user
  end

  def only_admin
    flash[:notice] == "管理者以外はアクセス出来ません"
    redirect_to tasks_path unless current_user.admin?
  end
end