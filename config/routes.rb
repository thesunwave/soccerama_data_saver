Rails.application.routes.draw do
  root 'competition#index'

  resources :competition, only: [:index, :show]
  resources :season, only: :show
  resources :team, only: [:index, :show] do
    get 'download'
  end
  resources :match, only: :show
  resources :player, only: :show do
    get 'download'
  end
end
