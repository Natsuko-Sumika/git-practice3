Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about', to: 'homes#about'
  post '/users/:id', to: 'books#create'
  resources :books, only: [:create, :show, :index, :edit, :update, :destroy]
  resources :users, only: [:show, :index, :edit, :update ]
end