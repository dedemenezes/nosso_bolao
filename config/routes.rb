Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :sweepstakes, only: :show do
    resources :participants, only: %i[new create]
  end
end
