require "test_helper"

class MusicgallerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get musicgaller_index_url
    assert_response :success
  end

  test "should get create" do
    get musicgaller_create_url
    assert_response :success
  end

  test "should get show" do
    get musicgaller_show_url
    assert_response :success
  end
end
