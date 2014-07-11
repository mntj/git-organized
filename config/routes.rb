Rails.application.routes.draw do

 #root to: 'welcome#index'
 match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

 match 'auth/failure', to: redirect('/'), via: [:get, :post]

 match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
