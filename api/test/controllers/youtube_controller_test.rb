require 'test_helper'

class YoutubeControllerTest < ActionDispatch::IntegrationTest
  test "should get download" do
    get youtube_download_url
    assert_response :success
  end

end
