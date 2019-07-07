require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
  end
  test "Unseccusssful edit" do
    logged_in_as(@user)
    # post login_path, params: { session: {email: @user.email, password: 'password'}}

   get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user),params:{user:{
      name:"",
      email:"foo@invalid",
      password:"foo",
      password_confirmation:"bar"}
    }
    assert_template 'users/edit'
    assert_select "div.alert"
    assert_select "div#error_explanation"
    assert_select "div.alert-danger" , "The form contains 4 errors."
  end
  test "successful edit"do
    logged_in_as(@user)

    # post login_path, params: { session: {email: @user.email, password: 'password'}}

    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params:{
      user:{
        name: name,
        email: email,
        password: "",
        password_confirmation: ""
      }
    }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url

  end
  test "should redirect update when not logged in"do
    patch user_path(@user), params:{user:{
    name: @user.name,
    email:@user.email
    }
  }
  assert_not flash.empty?
  assert_redirected_to login_url
  end
end
