require "application_system_test_case"

class DataEntriesTest < ApplicationSystemTestCase
  setup do
    @data_entry = data_entries(:one)
  end

  test "visiting the index" do
    visit data_entries_url
    assert_selector "h1", text: "Data entries"
  end

  test "should create data entry" do
    visit data_entries_url
    click_on "New data entry"

    fill_in "Agrovet", with: @data_entry.agrovet_id
    fill_in "Money owed", with: @data_entry.money_owed
    fill_in "Money paid", with: @data_entry.money_paid
    fill_in "Product 1 quantity", with: @data_entry.product_1_quantity
    fill_in "Product 2 quantity", with: @data_entry.product_2_quantity
    fill_in "Product 3 quantity", with: @data_entry.product_3_quantity
    fill_in "Product 4 quantity", with: @data_entry.product_4_quantity
    click_on "Create Data entry"

    assert_text "Data entry was successfully created"
    click_on "Back"
  end

  test "should update Data entry" do
    visit data_entry_url(@data_entry)
    click_on "Edit this data entry", match: :first

    fill_in "Agrovet", with: @data_entry.agrovet_id
    fill_in "Money owed", with: @data_entry.money_owed
    fill_in "Money paid", with: @data_entry.money_paid
    fill_in "Product 1 quantity", with: @data_entry.product_1_quantity
    fill_in "Product 2 quantity", with: @data_entry.product_2_quantity
    fill_in "Product 3 quantity", with: @data_entry.product_3_quantity
    fill_in "Product 4 quantity", with: @data_entry.product_4_quantity
    click_on "Update Data entry"

    assert_text "Data entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Data entry" do
    visit data_entry_url(@data_entry)
    click_on "Destroy this data entry", match: :first

    assert_text "Data entry was successfully destroyed"
  end
end
