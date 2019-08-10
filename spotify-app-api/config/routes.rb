Rails.application.routes.draw do
  resources :songs
  resources :users, only: [:create, :update, :destroy]
  resources :login, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
