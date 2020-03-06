require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "user@example.com", password: "password", username: "ana", name: "Ana", phone: "0757079008")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
end
