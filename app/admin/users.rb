ActiveAdmin.register User do

  permit_params :email, :name, :phone, :followers_count, :followees_count, :avatar, :photographer_id, :password, :password_confirmation

  index do
    column 'ID', &:id
    column 'Email' do |user|
      link_to user.username, admin_user_path(user)
    end
    column 'Email', &:email
    column 'Name', &:name
    column 'Avatar' do |user|
      image_tag user.avatar.thumb.url if user&.avatar&.thumb&.url&.present?
    end
    column :photographers, &:photographer
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :phone
      row :avatar do |user|
        image_tag user.avatar.thumb.url
      end
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs 'User Details' do
      f.input :email
      f.input :name
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
      f.input :avatar
      f.input :phone
    end
    f.actions
  end
end
