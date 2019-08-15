Rails.application.routes.draw do
  resources :playlists do
    resources :tracks
  end

  resources :users, only: [:create, :update, :destroy]
  resources :search, only: [:show]
  resources :albums, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
