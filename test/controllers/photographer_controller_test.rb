require 'test_helper'

class PhotographerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photographer_index_url
    assert_response :success
  end

  test "should get show" do
    get photographer_show_url
    assert_response :success
  end

  test "should get create" do
    get photographer_create_url
    assert_response :success
  end

  test "should get update" do
    get photographer_update_url
    assert_response :success
  end

  test "should get delete" do
    get photographer_delete_url
    assert_response :success
  end

end
