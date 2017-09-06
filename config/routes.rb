Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'

  resources :groups, only: [:new, :index, :create]

  resources :participations, only: [:new]

end
