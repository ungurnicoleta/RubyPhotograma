# frozen_string_literal: true

ActiveAdmin.register Like do
  permit_params :user_id, :owner_id, class_name: 'User', foreign_key: 'owner_id'

end
