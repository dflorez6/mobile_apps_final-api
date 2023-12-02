require "test_helper"

class PropertyTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_type = property_types(:one)
  end

  test "should get index" do
    get property_types_url, as: :json
    assert_response :success
  end

  test "should create property_type" do
    assert_difference("PropertyType.count") do
      post property_types_url, params: { property_type: { name: @property_type.name } }, as: :json
    end

    assert_response :created
  end

  test "should show property_type" do
    get property_type_url(@property_type), as: :json
    assert_response :success
  end

  test "should update property_type" do
    patch property_type_url(@property_type), params: { property_type: { name: @property_type.name } }, as: :json
    assert_response :success
  end

  test "should destroy property_type" do
    assert_difference("PropertyType.count", -1) do
      delete property_type_url(@property_type), as: :json
    end

    assert_response :no_content
  end
end
