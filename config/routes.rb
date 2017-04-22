Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :stories #all the routes we have done in the past
end
