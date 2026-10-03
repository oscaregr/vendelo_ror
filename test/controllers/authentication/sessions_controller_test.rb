require "test_helper"

class Authentication::UserControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:paco)
  end
  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should login an user by email" do
      post users_url, params: { user: { login: @user.email, password: "pacotest" } }

    assert_redirected_to products_url
  end
    test "should login an user by username" do
      post users_url, params: { user: { login: @user.username, password: "pacotest" } }

    assert_redirected_to products_url
  end
end
