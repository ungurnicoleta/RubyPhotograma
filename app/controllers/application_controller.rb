class ApplicationController < ActionController::Base

  def active_admin_controller?
    is_a?(ActiveAdmin::BaseController)
  end
  protect_from_forgery prepend: true, with: :exception

  def hello
    render html: "hello, world!"
  end

end
