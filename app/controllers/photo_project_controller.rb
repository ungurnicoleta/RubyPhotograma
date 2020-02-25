class PhotoProjectController < ApplicationController
  def index
    @photo_projects = PhotoProject.all
  end

  def hello
    @message = 'Hello, how are you today?'
  end
end
