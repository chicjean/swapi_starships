Rails.application.routes.draw do
 
 root 'starships#index'

 resources :starships
end
