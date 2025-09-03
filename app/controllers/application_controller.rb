class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [ :login ])
    # 注册时允许 username
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username, :email, :phone ])
    # 修改资料时允许 username
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username, :email, :phone ])
  end
end
