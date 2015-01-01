require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_select "h1", "Welcome to my OmniAuth App!"
  end

end
