Rails.application.routes.draw do


  resources :tech_courses
  resources :courses
  resources :teches
  
  resources :teches do 
   resources :courses
  end
  


devise_for :users,path_names: {sign_in: "login", sign_out: "logout" }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  root 'teches#index'
  get '/users/log_out' => "application#destroy"
  get 'teches/:id/delete' => "teches#destroy"

end
