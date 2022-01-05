Rails.application.routes.draw do
  root 'restaurants#index'
  
  resources :restaurants do
    resources :items do
      resources :orders
    end
  end

  resources :orders
  
  devise_for :users, controllers: { sessions: 'users/sessions' }


  # devise_for :users

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
