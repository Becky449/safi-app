require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference("Order.count") do
      post orders_url, params: { order: { agrovet_id: @order.agrovet_id, order_number: @order.order_number, product_1_quantity: @order.product_1_quantity, product_2_quantity: @order.product_2_quantity, product_3_quantity: @order.product_3_quantity, product_4_quantity: @order.product_4_quantity, status: @order.status, total_amount: @order.total_amount } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { agrovet_id: @order.agrovet_id, order_number: @order.order_number, product_1_quantity: @order.product_1_quantity, product_2_quantity: @order.product_2_quantity, product_3_quantity: @order.product_3_quantity, product_4_quantity: @order.product_4_quantity, status: @order.status, total_amount: @order.total_amount } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference("Order.count", -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
