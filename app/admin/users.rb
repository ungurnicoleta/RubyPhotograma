ActiveAdmin.register User do

  permit_params :email, :name, :username, :phone, :avatar, :followers_count,
 :followees_count, :role_ids, :photographer_id, :password, :password_confirmation

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
    column 'Followers count', &:followers_count
    column 'Followees count', &:followees_count
    column :roles do |user|
    user.roles.collect(&:name).to_sentence
    end
    column :photographers, &:photographer
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :username
      row :email
      row :phone
      row :avatar do |user|
        image_tag user.avatar.thumb.url
      end
      row :followers_count
      row :followees_count
      row :roles do |user|
        user.roles.collect(&:name).to_sentence
      end
      row :photographers, &:photographer
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs 'User Details' do
      f.input :email
      f.input :name
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
      f.input :username
      f.input :avatar
      f.input :roles, collection: Role.global,
              label_method: ->(el) { t "simple_form.options.user.roles.#{el.name}" }
    end
    f.actions
  end
end
