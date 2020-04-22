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

  namespace :api do
    namespace :v1 do
      # this route will authorize requests using the User class
      get 'demo/members_only', to: 'demo_user#members_only'
      get 'demo/user_photo_projects', to: 'demo_user#user_photo_projects'
      get :authenticated, to: 'application#authenticated_route'
    end
  end
  get 'welcome/index'

  ActiveAdmin.routes(self)
  root 'application#hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
