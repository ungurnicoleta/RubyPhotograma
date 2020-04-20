Rails.application.routes.draw do
  resources :addresses
  resources :photo_tags
  resources :tags
  resources :photos
  resources :appointments
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  get 'welcome/index'
  get :auth, to: 'application#authenticated_user'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'application#hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
