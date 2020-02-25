ActiveAdmin.register PhotoProject do
  permit_params :title, :location, :date, :price, :user_id
end
