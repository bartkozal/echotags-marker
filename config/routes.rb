Rails.application.routes.draw do
  resources :points, except: [:show, :new]
  resources :categories
  resources :markers, only: :index

  root 'points#index'
end
