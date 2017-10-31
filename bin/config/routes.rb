Rails.application.routes.draw do

  resources :comments
  resources :users
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles


  get 'singup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
