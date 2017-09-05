Rails.application.routes.draw do

  get 'participations/new'

  get 'groups/new'

  get 'group/new'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  root to: 'pages#home'

  resources :groups, only: [:new]

end
