# frozen_string_literal: true
ActiveAdmin.register Address do
  permit_params :city, :region, :country, :zip
end
