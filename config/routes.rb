Rails.application.routes.draw do
  root "articles#index"
  resources :articles do
    resources :comments
  end

  devise_for :users, controllers: {
   sessions: 'users/sessions',
   registrations: 'users/registrations',
  }

  resources :users do
    resources :relationships, only: [:create]
  end
  resources :relationships, only: [:destroy]

  get 'articles/user/:user_id', to: 'articles#from_author', as: 'article_from_user'

end
