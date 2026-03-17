require "test_helper"

class HealthControllerTest < ActionDispatch::IntegrationTest
  test "should return health status" do
    get health_check_url

    assert_response :success

    body = JSON.parse(response.body)
    assert_equal "ok", body["status"]
    assert_equal true, body["database"]
  end
end
