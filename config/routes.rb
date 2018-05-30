Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'pages#home'
  get 'pages/about', to: 'pages#about'
  
  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create' # for undefined method users_path
  resources :users, except: [:new] # other solution for error
  
  resources :articles
  
end
