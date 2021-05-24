Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms, only: [:show, :create] do
    resources :races, only: [:show, :create] do
      resources :runnings, only: [:create, :index]
      resources :horses, only: [:create, :index]
      resources :bets, only: [:new, :edit, :create, :update]
    end
  end
end
