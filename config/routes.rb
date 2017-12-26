Rails.application.routes.draw do
  resources :smartphones
  resources :users
  resources :sims
  resources :requests
  resources :bams
  resources :user_records

  # Home HomePage
  root to: 'home_pages#home'
  # Request Home
  get '/requests/home/menu' => 'home_pages#request_home'
  # Validate User
  get '/requests/home/validate' => 'requests#validate_user'

  # New Form
  get '/requests/forms/new' => 'requests#new_form'
  # save New Form
  post '/requests/forms/create/new' => 'requests#create'

  # Renew Form
  get '/requests/forms/renew' => 'requests#renew_form'

  #########TEST##########
  get '/test_new' => 'requests#test_new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
