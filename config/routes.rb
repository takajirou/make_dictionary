Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'books#index'
  resources :books do
    collection { get :search }
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
