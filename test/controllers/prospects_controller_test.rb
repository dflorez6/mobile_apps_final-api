require "test_helper"

class ProspectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prospect = prospects(:one)
  end

  test "should get index" do
    get prospects_url, as: :json
    assert_response :success
  end

  test "should create prospect" do
    assert_difference("Prospect.count") do
      post prospects_url, params: { prospect: { city: @prospect.city, country: @prospect.country, dob: @prospect.dob, email: @prospect.email, first_name: @prospect.first_name, last_name: @prospect.last_name, name: @prospect.name, password: @prospect.password, password_confirmation: @prospect.password_confirmation, phone: @prospect.phone, postal_code: @prospect.postal_code, province: @prospect.province, street: @prospect.street } }, as: :json
    end

    assert_response :created
  end

  test "should show prospect" do
    get prospect_url(@prospect), as: :json
    assert_response :success
  end

  test "should update prospect" do
    patch prospect_url(@prospect), params: { prospect: { city: @prospect.city, country: @prospect.country, dob: @prospect.dob, email: @prospect.email, first_name: @prospect.first_name, last_name: @prospect.last_name, name: @prospect.name, password: @prospect.password, password_confirmation: @prospect.password_confirmation, phone: @prospect.phone, postal_code: @prospect.postal_code, province: @prospect.province, street: @prospect.street } }, as: :json
    assert_response :success
  end

  test "should destroy prospect" do
    assert_difference("Prospect.count", -1) do
      delete prospect_url(@prospect), as: :json
    end

    assert_response :no_content
  end
end
