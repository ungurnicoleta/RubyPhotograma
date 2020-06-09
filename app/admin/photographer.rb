# frozen_string_literal: true
ActiveAdmin.register Photographer do
  permit_params :name, :user_id, :description, :secondDescription, :rating, :price, :cameraDescription, :address_id, :city, hashtags_attributes: [:id, :style_id]


  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs 'Photographer Details' do
      f.input :user
      f.input :city
      f.input :description
      f.input :secondDescription
      f.input :cameraDescription
      f.input :price
      f.has_many :hashtags, allow_destroy: true, as: :check_boxes do |n_f|
        n_f.input :style
      end
      f.actions
  end
  end
end


