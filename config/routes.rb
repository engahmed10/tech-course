Rails.application.routes.draw do


  resources :institutes
  resources :educations
  resources :courses
 
  
  resources :educations do 
   resources :courses
  end
  


devise_for :users,path_names: {sign_in: "login", sign_out: "logout" }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  root 'educations#index'
  get '/users/log_out' => "application#destroy"
  #get 'educations/:id/delete' => "educations#destroy"

end
