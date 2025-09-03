class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_superuser
  before_action :set_user, only: [ :edit, :update, :destroy ]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "用户创建成功"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "用户更新成功"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "用户已删除"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :phone, :email, :password, :password_confirmation, :is_superuser)
  end

  def require_superuser
    redirect_to root_path, alert: "没有权限" unless current_user&.is_superuser?
  end
end
