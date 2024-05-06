require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    # Lấy micheal từ fixture
    @user = users(:micheal)
    # Init a microposts
    @micropost = @user.microposts.build(content: "Lorem")
  end

  test "should be valid" do
    # Check by valid function
    assert @micropost.valid?
  end

  test "User id presence" do
    # Set usr_id = nil for test
    @micropost.user_id = nil
    # Not valid when user_id = nil
    assert_not @micropost.valid?
  end

  test "Content presence" do
    # Set content contains only whitespace
    @micropost.content = '           '
    # Not valid is true value
    assert_not @micropost.valid?
  end

  test "Not over 140 characters" do
    # Setup content over 140 chars
    @micropost.content = 'a' * 141
    # Not valid is true value
    assert_not @micropost.valid?
  end

  test "recent first" do
    assert_equal microposts(:recent), Micropost.first
  end
end
