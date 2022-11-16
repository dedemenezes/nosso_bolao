Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tournaments, only: :show do
    resources :matches, only: :index
  end
  resources :participants, only: %i[new create]

  resources :matches, only: [] do
    resources :match_bets, only: %i[create update edit]
  end
end
