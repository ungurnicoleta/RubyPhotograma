# frozen_string_literal: true
ActiveAdmin.register Photographer do
  permit_params :name, :user_id, :description, :secondDescription, :rating, :price, :cameraDescription, :address_id
end
