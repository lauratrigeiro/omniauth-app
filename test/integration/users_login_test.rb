require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
  	@user = users(:bob)
  end

  test "should see correct links on home page if logged in then logged out" do
	# Sign in user
  	post_via_redirect user_session_path, user: { email: 	@user.email,
  									   			 password: 	'password' }
  	assert_response :success
  	assert_template 'static_pages/index'
  	assert_select "a[href=?]", new_user_registration_path, count: 0
 	assert_select "a[href=?]", new_user_session_path, count: 0
  	assert_select "a[href=?]", edit_user_registration_path
  	assert_select "a[href=?]", destroy_user_session_path
	# Sign out user
	delete destroy_user_session_path
	follow_redirect!
	assert_template 'static_pages/index'
  	assert_select "a[href=?]", new_user_registration_path
  	assert_select "a[href=?]", new_user_session_path
  	assert_select "a[href=?]", edit_user_registration_path, count: 0
  	assert_select "a[href=?]", destroy_user_session_path, count: 0
  end

end