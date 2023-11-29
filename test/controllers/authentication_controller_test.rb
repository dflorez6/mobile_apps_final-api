require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get OwnerLogin" do
    get authentication_OwnerLogin_url
    assert_response :success
  end

  test "should get ProspectLogin" do
    get authentication_ProspectLogin_url
    assert_response :success
  end
end
