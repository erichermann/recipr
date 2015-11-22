Rails.application.routes.draw do

  devise_for :users do
    #post   "/users" => "devise/sessions#new"
    #delete "/users" => "devise/sessions#new"
    get "/users/sign_up" => "devise/sessions#new"
    get '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  
  #------------------------------------------------------------------------
  # root
  #------------------------------------------------------------------------
  root :to => "home#index"
  #------------------------------------------------------------------------

  resources :recipe
  
  get '/:controller(/:action(/:id))'
end
