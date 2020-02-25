require 'test_helper'

class PhotoProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get photo_project_hello_url
    assert_response :success
  end

end
