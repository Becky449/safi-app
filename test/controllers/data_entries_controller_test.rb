require "test_helper"

class DataEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_entry = data_entries(:one)
  end

  test "should get index" do
    get data_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_data_entry_url
    assert_response :success
  end

  test "should create data_entry" do
    assert_difference("DataEntry.count") do
      post data_entries_url, params: { data_entry: { agrovet_id: @data_entry.agrovet_id, money_owed: @data_entry.money_owed, money_paid: @data_entry.money_paid, product_1_quantity: @data_entry.product_1_quantity, product_2_quantity: @data_entry.product_2_quantity, product_3_quantity: @data_entry.product_3_quantity, product_4_quantity: @data_entry.product_4_quantity } }
    end

    assert_redirected_to data_entry_url(DataEntry.last)
  end

  test "should show data_entry" do
    get data_entry_url(@data_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_entry_url(@data_entry)
    assert_response :success
  end

  test "should update data_entry" do
    patch data_entry_url(@data_entry), params: { data_entry: { agrovet_id: @data_entry.agrovet_id, money_owed: @data_entry.money_owed, money_paid: @data_entry.money_paid, product_1_quantity: @data_entry.product_1_quantity, product_2_quantity: @data_entry.product_2_quantity, product_3_quantity: @data_entry.product_3_quantity, product_4_quantity: @data_entry.product_4_quantity } }
    assert_redirected_to data_entry_url(@data_entry)
  end

  test "should destroy data_entry" do
    assert_difference("DataEntry.count", -1) do
      delete data_entry_url(@data_entry)
    end

    assert_redirected_to data_entries_url
  end
end
