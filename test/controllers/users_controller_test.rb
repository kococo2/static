require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end
  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when logged in as wrong user" do
      logged_in_as(@other_user)
      get edit_user_path(@user)
      assert flash.empty?
      assert_redirected_to root_url
    end

    test "should redirect update when logged in as wrong user" do
      logged_in_as(@other_user)
      patch user_path(@user), params: { user: { name: @user.name,
                                                email: @user.email } }
      assert flash.empty?
      assert_redirected_to root_url
    end
    test "successful edit with friendly forwarding" do
      get edit_user_path(@user)
      logged_in_as(@user)
      assert_redirected_to edit_user_url(@user)

      name  = "Foo Bar"
      email = "foo@bar.com"
      patch user_path(@user), params: { user: { name:  name,
                                             email: email,
                                             password:              "",
                                             password_confirmation: "" } }
      assert_not flash.empty?
      assert_redirected_to @user
      @user.reload
      assert_equal name,  @user.name
      assert_equal email, @user.email

    end
    test "successful second login redirect_to profile" do
      get edit_user_path(@user)
      logged_in_as(@user)
      assert_redirected_to edit_user_url(@user)
      delete logout_path
      logged_in_as(@user)
    end

    test "should redirect index when not logged in" do
      get users_path
      assert_redirected_to login_url
    end

    test "should not allow the admin attribute to be edited via the web" do
      logged_in_as(@other_user)
      assert_not @other_user.admin?
      patch user_path(@other_user), params:{
        user:{
          password: "password",
          password_confirmation: "password",
          admin: 1
        }
      }
      assert_not @other_user.admin?
    end
    test "should redirect destroy when not logged in" do
      assert_no_difference 'User.count' do
        delete user_path(@user)
      end
      assert_redirected_to login_url
    end

    test "should redirect destroy when logged in as a non-admin" do
      logged_in_as(@other_user)
      assert_no_difference 'User.count' do
        delete user_path(@user)
      end
      assert_redirected_to root_url
    end
  end
