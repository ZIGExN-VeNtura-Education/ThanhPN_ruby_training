require "test_helper"

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  # setup test with micheal user
  def setup
    @user = users(:micheal)
  end

  test "profile display" do
    puts user_path(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    # check h1 tag have img tag with gravatar class
    assert_select 'h1>img.gravatar'
    # check is microposts count in somewhere in html
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'div.pagination'
    @user.microposts.paginate(page: 1).each do |micropost|
      # check is microposts content in somewhere in html
      assert_match micropost.content, response.body
    end
  end
end
