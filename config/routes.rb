Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_up' => 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  #### resources
  resources :recipe

  #### root
  root to: 'home#index'

  get '/:controller(/:action(/:id))'
end
