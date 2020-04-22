ActiveAdmin.register User do

  permit_params :email, :name, :username, :phone, :avatar, :role_id
  index do
    column "ID", &:id
    column "Email" do |user|
      link_to user.username, admin_user_path(user)
    end
    column "Email", &:email
    column "Name", &:name
    column "Avatar", &:avatar
    column :roles do |user|
    user.roles.collect {|c| c.name.capitalize }.to_sentence
  end
  actions
  end

  show do |ad|
    attributes_table do
      row :id
      row :name
      row :username
      row :email
      row :phone
      row :roles do |user|
      user.roles.collect {|r| r.name.capitalize }.to_sentence
    end
    end
  end

  form do |f|

    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :name
      f.input :username
      f.input :avatar
      f.input :roles, collection: Role.global,
              label_method: lambda { |el| t "simple_form.options.user.roles.#{el.name}" }

    end
    f.actions
  end

  controller do
    def update
      params[:user].each{|k,v| resource.send("#{k}=",v)}
      super
    end

    def permitted_params
      params.permit user: [:email, :name, :username, :phone, :avatar,:role_id]
    end
  end
end