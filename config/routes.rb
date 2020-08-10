Rails.application.routes.draw do

  resources :teches
  devise_for :users
  root 'teches#index'
  get '/users/sign_out' => "session#destroy"

  get 'teches/:id/delete' => "teches#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
