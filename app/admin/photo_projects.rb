# frozen_string_literal: true
ActiveAdmin.register PhotoProject do
  permit_params :title, :user_id
end
