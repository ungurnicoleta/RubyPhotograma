class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token

  def hello
    render html: "hello, world!"
  end

  def authenticated_route
    authenticate_user!
    render json: { user: current_user }
  end

end
