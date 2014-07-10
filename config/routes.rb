Rails.application.routes.draw do
 root to: 'index'
 get '/auth/:provider/callback', to: 'index'
end
