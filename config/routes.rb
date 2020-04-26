Rails.application.routes.draw do
  resources :addresses
  resources :photo_tags
  resources :tags
  resources :photos
  resources :appointments
  devise_for :admin_users, ActiveAdmin::Devise.config
  scope :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users do
        resources :photographers
      end
      # this route will authorize requests using the User class
      #
      get 'demo/my_photographer', to: 'demo#my_photographer'
      get 'demo/members_only', to: 'demo_user#members_only'
      get 'demo/user_photo_projects', to: 'demo_user#user_photo_projects'
      get 'demo/photographers', to: 'demo_user#photographers'
      get :authenticated, to: 'application#authenticated_route'
    end
  end

  get 'welcome/index'

  ActiveAdmin.routes(self)
  root 'application#hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
