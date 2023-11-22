require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get properties_url, as: :json
    assert_response :success
  end

  test "should create property" do
    assert_difference("Property.count") do
      post properties_url, params: { property: { building_name: @property.building_name, city: @property.city, country: @property.country, is_apartment: @property.is_apartment, latitude: @property.latitude, longitude: @property.longitude, owner_id: @property.owner_id, postal_code: @property.postal_code, province: @property.province, rent_price: @property.rent_price, street: @property.street, tower_number: @property.tower_number, unit_number: @property.unit_number } }, as: :json
    end

    assert_response :created
  end

  test "should show property" do
    get property_url(@property), as: :json
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { building_name: @property.building_name, city: @property.city, country: @property.country, is_apartment: @property.is_apartment, latitude: @property.latitude, longitude: @property.longitude, owner_id: @property.owner_id, postal_code: @property.postal_code, province: @property.province, rent_price: @property.rent_price, street: @property.street, tower_number: @property.tower_number, unit_number: @property.unit_number } }, as: :json
    assert_response :success
  end

  test "should destroy property" do
    assert_difference("Property.count", -1) do
      delete property_url(@property), as: :json
    end

    assert_response :no_content
  end
end
