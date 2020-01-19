require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:michael)
  end
  
  # 1. Visit the login path.
  # 2. Post valid information to the sessions path.
  # 3. Verify that the login link disappears.
  # 4. Verify that a logout link appears
  # 5. Verify that a profile link appears.
  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email: @user.email, password: 'foobar' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end
  
  # 1. Visit the login path.
  # 2. Verify that the new sessions form renders properly.
  # 3. Post to the sessions path with an invalid params hash.
  # 4. Verify that the new sessions form gets re-rendered and that a flash message
  # appears.
  # 5. Visit another page (such as the Home page).
  # 6. Verify that the flash message doesn’t appear on the new page.
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "wrong@wrong.com", password: "asdfg"} }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end 
  
  
end
