Rails.application.routes.draw do

  # GitHub
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'welcome#index'
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  # Sorcery Authentication
  get 'signup' => 'users#new', as: 'signup'
  post '/users' => 'users#create', as: 'users'
  delete '/users/:id' => 'users#destroy', as: 'destroy_user'

end
