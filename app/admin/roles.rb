# frozen_string_literal: true
ActiveAdmin.register Role do
  permit_params :name

  filter :users_id, as: :search_select_filter, url: proc { admin_users_path },
         fields: [:name, :email, :username], display_name: 'email', minimum_input_length: 1,
         order_by: 'email_asc'

  filter :resource_type
  filter :name
  filter :created_at
  filter :updated_at
end
