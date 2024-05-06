require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @micropost = microposts(:orange)
  end

  test "redirect create when not logged in" do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: {micropost: {content: 'Lorem'}}
    end
    assert_redirected_to login_url
  end

  test "redirect destroy when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete micropost_path(@micropost.id)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    # Use micheal user
    login_as(users(:micheal))
    # remove micropost of archer
    micropost = microposts(:ants)
    # Cant delete micropost
    assert_no_difference 'Micropost.count' do
      delete micropost_path(micropost)
    end
    # and redirect to root_url
    assert_redirected_to root_url
  end
end
