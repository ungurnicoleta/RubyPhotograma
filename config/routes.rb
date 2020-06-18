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
        resources :photographers do
          resources :addresses
          resources :photos
        end
      end

      resources :photographers do
        resources :addresses
        resources :photos
        resources :styles
      end
      resources :addresses
      resources :photos
      resources :appointments
      resources :styles
      resources :hashtags
      resources :likes

      # this route will authorize requests using the User class
      #
      get 'demo/my_photographer', to: 'demo#my_photographer'
      get 'demo/members_only', to: 'demo_user#members_only'
      get 'demo/user_photo_projects', to: 'demo_user#user_photo_projects'
      get 'demo/photographers', to: 'demo_user#photographers'
      get 'addresses/get_city', to: 'addresses#get_city'
      get 'demo/get_photographers_for_city', to: 'demo#get_photographers_for_city'
      get 'demo/user_photographer', to: 'demo#user_photographer'
      get 'photos/get_photo_by_photographer', to: 'photos#get_photo_by_photographer'
      get 'styles/get_styles_for_photographer', to: 'styles#get_styles_for_photographer'
      get 'hashtags/get_hashtags_for_photographer', to: 'hashtags#get_hashtags_for_photographer'
      get 'likes/get_likes_for_user', to: 'likes#get_likes_for_user'
      get :authenticated, to: 'application#authenticated_route'

    end
  end

  get 'welcome/index'

  ActiveAdmin.routes(self)
  root 'application#hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
