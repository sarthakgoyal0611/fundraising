Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :fund_events
  # resources :checkout, only: [:create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"

  get 'pages/contact' 
  get 'events/show'
  get 'pages/about'
  get 'users', to: 'users#index'
  get 'events/edit/:id', to: 'events#edit' , as: :edit_events_by_admin
  get '/search_event', to: 'events#search_event'

  get '/search_user', to: 'users#search_user'
  #get '/search_event/:title', to: 'events#search_event'
  get '/user/:id', to: 'users#show', as: :user
  delete '/users/:id', to: 'users#delete_user', as: :delete_user

end
