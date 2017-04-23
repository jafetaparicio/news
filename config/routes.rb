Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :stories do #all the routes we have done in the past
    member do
      get 'upvote'
      get 'downvote'
    end
  end
end
