Rails.application.routes.draw do

  resource 'profile', only: [:show, :update]

  # Phone verification
  post 'verify' => 'verify#verify'

  resources 'plans', only: [:index]
  post 'token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
