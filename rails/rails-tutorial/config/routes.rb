Rails.application.routes.draw do
  get 'sessions/new'

	root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new' # page for a new session
  post '/login', to: 'sessions#create' # create a new session
  delete '/logout', to: 'sessions#destroy' # delete a session
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
