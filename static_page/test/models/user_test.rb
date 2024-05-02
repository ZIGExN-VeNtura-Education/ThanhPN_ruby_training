require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example", email: "test@gmail.com",
      password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should be presence" do
    @user.name = "                    "
    assert_not @user.valid?
  end

  test "email should be presence" do
    @user.email = "                    "
    assert_not @user.valid?
  end

  test "email should be limit at 200 char" do
    @user.email = "a" * 200 + "@gmail.com"
    assert_not @user.valid?
  end

  test "name should be limit at 54 char" do
    @user.name = "a" * 55
    assert_not @user.valid?
  end

  test "email validation should accept valid address" do
    valid_address = %w[abc@example.com USER@foo.COM A_US-ER@foo.bar.org foo_bax@foobz.com]

    valid_address.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?( :remember, '')
  end
end
