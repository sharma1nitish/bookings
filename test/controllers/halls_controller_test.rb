require 'test_helper'

class HallsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get halls_show_url
    assert_response :success
  end

end
