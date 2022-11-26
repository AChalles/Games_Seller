require "test_helper"

class PastOrderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get past_order_index_url
    assert_response :success
  end

  test "should get show" do
    get past_order_show_url
    assert_response :success
  end
end
