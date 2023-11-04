require "test_helper"

class AgrovetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agrovet = agrovets(:one)
  end

  test "should get index" do
    get agrovets_url
    assert_response :success
  end

  test "should get new" do
    get new_agrovet_url
    assert_response :success
  end

  test "should create agrovet" do
    assert_difference("Agrovet.count") do
      post agrovets_url, params: { agrovet: { location: @agrovet.location, name: @agrovet.name, owner_email: @agrovet.owner_email, owner_name: @agrovet.owner_name, owner_phone: @agrovet.owner_phone, user_id: @agrovet.user_id } }
    end

    assert_redirected_to agrovet_url(Agrovet.last)
  end

  test "should show agrovet" do
    get agrovet_url(@agrovet)
    assert_response :success
  end

  test "should get edit" do
    get edit_agrovet_url(@agrovet)
    assert_response :success
  end

  test "should update agrovet" do
    patch agrovet_url(@agrovet), params: { agrovet: { location: @agrovet.location, name: @agrovet.name, owner_email: @agrovet.owner_email, owner_name: @agrovet.owner_name, owner_phone: @agrovet.owner_phone, user_id: @agrovet.user_id } }
    assert_redirected_to agrovet_url(@agrovet)
  end

  test "should destroy agrovet" do
    assert_difference("Agrovet.count", -1) do
      delete agrovet_url(@agrovet)
    end

    assert_redirected_to agrovets_url
  end
end
