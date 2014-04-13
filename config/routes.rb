BasicStarterTemplate::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  resources :enquiries

  get "map" => "map#index"
  resources :posts do
    member do
      get :like
      get :unlike
    end
  end

  resources :business_profiles do
  	member do
  		get :leave
  		get :join
  	end
  end

  resources :user_profiles
  devise_for :users
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  root 'home#index'
end
