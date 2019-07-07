require 'test_helper'

class SiteLayoutsLinks < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
    test "layout links" do
      get root_path
      assert_template root_path
      assert_select "a[href=?]", root_path, count: 2
      assert_select "a[href=?]", help_path, count:0
      assert_select "a[href=?]", about_path
      assert_select "a[href=?]", contact_path
      assert_select "a[href=?]", login_path
      assert_select "a[href=?]", signup_path
      logged_in_as(@user)
      get root_path
      assert_select "a[href=?]", users_path
      assert_select "a[href=?]", user_path(@user)
      assert_select "a[href=?]", edit_user_path(@user)
      assert_select "a[href=?]", logout_path



    end
  end
