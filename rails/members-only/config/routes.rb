Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :members
  resources :posts
  get '/login', to: 'sessions#new' # page for a new session
  post '/login', to: 'sessions#create' # create a new session
  delete '/logout', to: 'sessions#destroy' # delete a session
end
