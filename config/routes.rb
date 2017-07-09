Rails.application.routes.draw do

  # Phone verification
  get 'verify' => 'verify#verify'

  resources 'plans', only: [:index]
  post 'token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
