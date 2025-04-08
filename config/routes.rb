Rails.application.routes.draw do
  root 'books#index'
  resources :books do
    collection { get :search }
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
