Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'
  get 'pages/link'
  
  resources :users
  
  resources :topics do
  get 'comments/index'
  post '/comments', to: 'comments#create'
  delete '/comments', to: 'comments#destroy'
  end
  
  
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
 
  
  get     '/login',  to: 'sessions#new'
  post    '/login',  to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  
 
end
