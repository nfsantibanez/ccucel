Rails.application.routes.draw do
  resources :plans
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
  # Follow Request
  get '/requests/home/follow_request' => 'home_pages#follow_request'

  # Show Request for user
  get '/requests/home/follow' => 'requests#show'
  # Validate User
  get '/requests/home/validate' => 'requests#validate_user'

  # TransferLine Form
  get '/requests/forms/transferline' => 'requests#transfer_line'
  # New Form
  get '/requests/forms/new' => 'requests#new_form'
  # Save New Form
  post '/requests/forms/create/new' => 'requests#create_user'
  # Renew Form
  get '/requests/forms/renew' => 'requests#renew_form'
  # Stolen or Lost Form
  get '/requests/forms/stolenlost' => 'requests#stolen_lost'
  # Technical Service Form
  get '/requests/forms/technicalservice' => 'requests#technical_service'
  # files
  get '/requests/files/:id' => 'requests#download_file'
  # Contract
  get '/requests/contracts/:id' => 'requests#download_contract'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
