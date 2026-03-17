require "test_helper"

class HealthTest < ActionDispatch::IntegrationTest
  test "GET /healthz returns 200 with expected JSON structure" do
    get "/healthz"

    assert_response :ok

    json = JSON.parse(response.body)
    assert_equal "ok", json["status"]
    assert json["timestamp"].present?
    assert_nothing_raised { Time.iso8601(json["timestamp"]) }
  end
end
