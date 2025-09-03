Rails.application.routes.draw do
  get "home/index"
  namespace :front do
    resources :majors
    resources :teachers
  end

  namespace :admin do
    get "/", to: "dashboards#index", as: :index
    resources :teachers
    resources :educations
    resources :majors
    resources :schools
    resources :users
  end
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "homes#index"
end
