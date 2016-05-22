Rails.application.routes.draw do
  resources :points, except: [:show, :new]
  resources :categories

  root 'points#index'
end
