require "test_helper"

class UserAgrovetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_agrovet = user_agrovets(:one)
  end

  test "should get index" do
    get user_agrovets_url
    assert_response :success
  end

  test "should get new" do
    get new_user_agrovet_url
    assert_response :success
  end

  test "should create user_agrovet" do
    assert_difference("UserAgrovet.count") do
      post user_agrovets_url, params: { user_agrovet: { agrovet_id: @user_agrovet.agrovet_id, user_id: @user_agrovet.user_id } }
    end

    assert_redirected_to user_agrovet_url(UserAgrovet.last)
  end

  test "should show user_agrovet" do
    get user_agrovet_url(@user_agrovet)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_agrovet_url(@user_agrovet)
    assert_response :success
  end

  test "should update user_agrovet" do
    patch user_agrovet_url(@user_agrovet), params: { user_agrovet: { agrovet_id: @user_agrovet.agrovet_id, user_id: @user_agrovet.user_id } }
    assert_redirected_to user_agrovet_url(@user_agrovet)
  end

  test "should destroy user_agrovet" do
    assert_difference("UserAgrovet.count", -1) do
      delete user_agrovet_url(@user_agrovet)
    end

    assert_redirected_to user_agrovets_url
  end
end
