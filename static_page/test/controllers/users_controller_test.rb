# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:micheal)
    @other = users(:archer)
  end
  test 'should get new' do
    get new_user_path
    assert_response :success
  end

  test 'should redirect when not logged in' do
    get users_path
    assert_redirected_to login_url
  end
end
