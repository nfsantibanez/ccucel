Rails.application.routes.draw do
  resources :user_records
  resources :smartphones
  resources :bams
  resources :requests
  resources :sims
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
