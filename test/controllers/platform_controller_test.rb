require "test_helper"

class PlatformControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get platform_index_url
    assert_response :success
  end
end
