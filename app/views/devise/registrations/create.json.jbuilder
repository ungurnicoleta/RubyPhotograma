json.user do |json|
  json.partial! 'users/users', user: current_user
end
