Rails.application.routes.draw do
  resources :seasons
  resources :movies
  resources :contents
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
