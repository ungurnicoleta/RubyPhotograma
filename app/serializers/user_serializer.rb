class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :avatar, :phone
end
