Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms, only: [:show, :create] do
    resources :races, only: [:create]
    resources :participations, only: [:create]
  end

  resources :races, only: :show do
    resources :runnings, only: :index
    resources :horses, only: :index
    resources :bets, only: [:create]
  end
  # resources :runnings, only: :create
end
