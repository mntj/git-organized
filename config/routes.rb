Rails.application.routes.draw do

  # GitHub
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  # Sorcery Authentication
  get 'signup' => 'users#new', as: 'signup'
  post '/users' => 'users#create', as: 'users'
  delete '/users/:id' => 'users#destroy', as: 'destroy_user'

end
