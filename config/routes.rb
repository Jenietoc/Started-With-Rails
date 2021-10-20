Rails.application.routes.draw do
  root "articles#index"
  resources :articles do
    resources :comments
  end
  get '/articles/', to: "articles#login", as: 'login'
end
