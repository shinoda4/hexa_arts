Rails.application.routes.draw do
  # 前台首页
  get "home/index"
  namespace :front do
    resources :majors
    resources :teachers
  end




  # 后台管理
  namespace :admin do
    get "/", to: "dashboards#index", as: :index
    resources :teachers
    resources :educations
    resources :majors
    resources :schools
  end
  devise_for :users # 后台用户管理

  # 健康检查
  get "up" => "rails/health#show", as: :rails_health_check

  # 根路径
  root "homes#index"
end
