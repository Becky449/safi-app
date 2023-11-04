require "application_system_test_case"

class UserAgrovetsTest < ApplicationSystemTestCase
  setup do
    @user_agrovet = user_agrovets(:one)
  end

  test "visiting the index" do
    visit user_agrovets_url
    assert_selector "h1", text: "User agrovets"
  end

  test "should create user agrovet" do
    visit user_agrovets_url
    click_on "New user agrovet"

    fill_in "Agrovet", with: @user_agrovet.agrovet_id
    fill_in "User", with: @user_agrovet.user_id
    click_on "Create User agrovet"

    assert_text "User agrovet was successfully created"
    click_on "Back"
  end

  test "should update User agrovet" do
    visit user_agrovet_url(@user_agrovet)
    click_on "Edit this user agrovet", match: :first

    fill_in "Agrovet", with: @user_agrovet.agrovet_id
    fill_in "User", with: @user_agrovet.user_id
    click_on "Update User agrovet"

    assert_text "User agrovet was successfully updated"
    click_on "Back"
  end

  test "should destroy User agrovet" do
    visit user_agrovet_url(@user_agrovet)
    click_on "Destroy this user agrovet", match: :first

    assert_text "User agrovet was successfully destroyed"
  end
end
