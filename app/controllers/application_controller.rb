class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery prepend: true, with: :exception

  def hello
    render html: "hello, world!"
  end

end
