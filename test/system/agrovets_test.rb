require "application_system_test_case"

class AgrovetsTest < ApplicationSystemTestCase
  setup do
    @agrovet = agrovets(:one)
  end

  test "visiting the index" do
    visit agrovets_url
    assert_selector "h1", text: "Agrovets"
  end

  test "should create agrovet" do
    visit agrovets_url
    click_on "New agrovet"

    fill_in "Location", with: @agrovet.location
    fill_in "Name", with: @agrovet.name
    fill_in "Owner email", with: @agrovet.owner_email
    fill_in "Owner name", with: @agrovet.owner_name
    fill_in "Owner phone", with: @agrovet.owner_phone
    fill_in "Sales rep", with: @agrovet.user_id
    click_on "Create Agrovet"

    assert_text "Agrovet was successfully created"
    click_on "Back"
  end

  test "should update Agrovet" do
    visit agrovet_url(@agrovet)
    click_on "Edit this agrovet", match: :first

    fill_in "Location", with: @agrovet.location
    fill_in "Name", with: @agrovet.name
    fill_in "Owner email", with: @agrovet.owner_email
    fill_in "Owner name", with: @agrovet.owner_name
    fill_in "Owner phone", with: @agrovet.owner_phone
    fill_in "Sales rep", with: @agrovet.user_id
    click_on "Update Agrovet"

    assert_text "Agrovet was successfully updated"
    click_on "Back"
  end

  test "should destroy Agrovet" do
    visit agrovet_url(@agrovet)
    click_on "Destroy this agrovet", match: :first

    assert_text "Agrovet was successfully destroyed"
  end
end
