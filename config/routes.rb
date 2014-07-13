Rails.application.routes.draw do

  root 'welcome#index'

  # GitHub
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'welcome#index'
  get '/signout' => 'sessions#destroy'

  # Sorcery Authentication
  get 'signup' => 'users#new', as: 'signup'
  post '/users' => 'users#create', as: 'users'
  delete '/users/:id' => 'users#destroy', as: 'destroy_user'

end
