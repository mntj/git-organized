Rails.application.routes.draw do

 #root to: 'welcome#index'
 get '/auth/:provider/callback' => 'welcome#index'

end
