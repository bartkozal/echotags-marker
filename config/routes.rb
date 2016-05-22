Rails.application.routes.draw do
  resources :points
  resources :categories

  root 'points#index'
end
