require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owner = owners(:one)
  end

  test "should get index" do
    get owners_url, as: :json
    assert_response :success
  end

  test "should create owner" do
    assert_difference("Owner.count") do
      post owners_url, params: { owner: { city: @owner.city, country: @owner.country, dob: @owner.dob, email: @owner.email, first_name: @owner.first_name, is_business: @owner.is_business, last_name: @owner.last_name, name: @owner.name, password: @owner.password, password_confirmation: @owner.password_confirmation, phone: @owner.phone, postal_code: @owner.postal_code, province: @owner.province, street: @owner.street, website_url: @owner.website_url } }, as: :json
    end

    assert_response :created
  end

  test "should show owner" do
    get owner_url(@owner), as: :json
    assert_response :success
  end

  test "should update owner" do
    patch owner_url(@owner), params: { owner: { city: @owner.city, country: @owner.country, dob: @owner.dob, email: @owner.email, first_name: @owner.first_name, is_business: @owner.is_business, last_name: @owner.last_name, name: @owner.name, password: @owner.password, password_confirmation: @owner.password_confirmation, phone: @owner.phone, postal_code: @owner.postal_code, province: @owner.province, street: @owner.street, website_url: @owner.website_url } }, as: :json
    assert_response :success
  end

  test "should destroy owner" do
    assert_difference("Owner.count", -1) do
      delete owner_url(@owner), as: :json
    end

    assert_response :no_content
  end
end
