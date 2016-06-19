require 'test_helper'

class SeasonControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get season_show_url
    assert_response :success
  end

  test "should get index" do
    get season_index_url
    assert_response :success
  end

end
