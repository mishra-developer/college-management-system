require "test_helper"

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get scaffold" do
    get teachers_scaffold_url
    assert_response :success
  end
end
