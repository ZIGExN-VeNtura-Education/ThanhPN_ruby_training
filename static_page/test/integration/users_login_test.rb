require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:micheal)
  end
  test "login with invalid information" do
    get login_path
    assert_template "session/new"
    post login_path, params: {session: {email: "", password: ""}}
    assert_template "session/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "Log in with valid information followed by log out" do
    get login_path
    post login_path, params: {
      session: {
        email: @user.email,
        password: "password"
      }
    }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    delete logout_path
    follow_redirect!
  end

  test "Login with remembering" do
    login_as(@user, remember_me: "1")
    assert_not_empty cookies[:remember_token]
  end

  test "Login without remembering" do
    login_as(@user, remember_me: "1")

    login_as(@user, remember_me: "0")
    assert_empty cookies[:remember_token]
  end
end
