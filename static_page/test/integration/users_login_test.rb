require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "login with invalid information" do
    get login_path
    assert_template "session/new"
    post login_path, params: {session: {email: "", password: ""}}
    assert_template "session/new"
    assert_not flash.empty?
    get root_path
    assert_not flash.empty?
  end
end
