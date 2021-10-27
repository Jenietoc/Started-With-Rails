Rails.application.routes.draw do
  root "articles#index"
  resources :articles do
    resources :comments
  end
  devise_for :users, controllers: {
   sessions: 'users/sessions',
   registrations: 'users/registrations'
  }
  get 'articles/user/:user_id', to: 'articles#from_author', as: 'article_from_user'
  get 'users/user/:user_id', to: 'users#profile', as: 'user_profile'
end
