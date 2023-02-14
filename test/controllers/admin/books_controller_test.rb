require "test_helper"

class Admin::BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_books_index_url
    assert_response :success
  end
end
