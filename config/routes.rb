Rails.application.routes.draw do
  devise_for :users
  resources :users 
  resources :posts
  resources :comments
  resources :likes
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/posts', to: 'users#posts'
  get '/users/:id/posts/:post_id', to: 'users#post_details'
  # resources :posts, only: [:index, :show]

  root "users#index"
end