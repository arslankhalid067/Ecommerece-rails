require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get orders_destroy_url
    assert_response :success
  end

end
