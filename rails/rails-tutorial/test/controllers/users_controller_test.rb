require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@user_a = users(:jane)
  	@user_b = users(:john)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
  	get edit_user_path(@user_a)
  	assert_not flash.empty?
  	assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
  	patch user_path(@user_a), params: {user: {name: @user_a.name,
  																						email: @user_a.email}}
  	assert_not flash.empty?
  	assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
  	log_in_as(@user_b)
  	get edit_user_path(@user_a)
  	assert flash.empty?
  	assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
  	log_in_as(@user_b)
  	patch user_path(@user_a), params: {user: {name: @user_a.name,
  																						email: @user_a.email}}
  	assert flash.empty?
  	assert_redirected_to root_url
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@user_b)
    assert_not @user_b.admin?
    patch user_path(@user_b), params: {user: {password: "password",
                                       password_confirmation: "password",
                                       admin: false }}
    assert_not @user_b.admin?
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user_a)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@user_b)
    assert_no_difference 'User.count' do
      delete user_path(@user_a)
    end
    assert_redirected_to root_url
  end  
end
