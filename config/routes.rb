Rails.application.routes.draw do
  resources :points, except: [:show, :new] do
    get 'search', on: :collection
  end
  resources :categories
  resources :markers, only: :index
  resources :reports, only: :index

  root 'points#index'
end
