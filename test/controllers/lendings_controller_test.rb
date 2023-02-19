require "test_helper"

class LendingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lendings_index_url
    assert_response :success
  end

  test "should get show" do
    get lendings_show_url
    assert_response :success
  end
end
