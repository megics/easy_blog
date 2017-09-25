require 'test_helper'

class Hq::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hq_dashboard_index_url
    assert_response :success
  end

end
