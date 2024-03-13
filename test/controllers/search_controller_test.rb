require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get search_list_url
    assert_response :success
  end

  test "should get map" do
    get search_map_url
    assert_response :success
  end
end
