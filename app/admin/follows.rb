# frozen_string_literal: true
ActiveAdmin.register Follow do
  permit_params :follower_id, :followee_id
end
