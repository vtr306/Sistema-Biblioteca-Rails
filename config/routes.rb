Rails.application.routes.draw do
  devise_for :users
  resources :reservations
  resources :librarians
  resources :books
  resources :authors
  resources :categories
  resources :clients
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
