require 'test_helper'

class Hq::AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get show,edit,update,destroy" do
    get hq_admins_show,edit,update,destroy_url
    assert_response :success
  end

end
