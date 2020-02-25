# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  resource :photo_project, only: [:show, :index]
  ActiveAdmin.routes(self)
  root 'application#hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
