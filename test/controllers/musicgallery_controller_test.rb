require "test_helper"

class MusicgalleryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get musicgallery_index_url
    assert_response :success
  end
end
