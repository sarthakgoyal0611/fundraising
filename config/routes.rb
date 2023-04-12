Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :fund_events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"

  get 'pages/contact' 
  get 'events/show'
  get 'pages/about'
  get 'users', to: 'users#index'
  get 'events/edit'
  get '/search_event', to: 'search#search_event'
  get '/user/:id', to: 'users#show'

end
