require "test_helper"

class Admin::RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_requests_index_url
    assert_response :success
  end
end
