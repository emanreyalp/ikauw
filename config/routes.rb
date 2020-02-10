Rails.application.routes.draw do
  resources :seasons, only: :index
  resources :movies, only: :index
  resources :contents, only: :index do
    resources :purchases, only: :create
  end
  resources :library, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
