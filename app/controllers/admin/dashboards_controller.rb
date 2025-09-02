class Admin::DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_superuser # 确保超级用户

  def index
  end

  private

  def check_superuser
    unless current_user.is_superuser
      redirect_to root_path, alert: "你没有权限访问该页面"
    end
  end
end
