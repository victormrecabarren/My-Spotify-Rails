Rails.application.routes.draw do
  resources :tracks
  resources :playlists
  resources :songs
  resources :users, only: [:create, :update, :destroy]
  resources :search, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end