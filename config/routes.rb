Rails.application.routes.draw do
  resources :smartphones
  resources :users
  resources :sims
  resources :requests
  resources :bams
  resources :user_records

  # Home HomePage
  root to: 'home_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
