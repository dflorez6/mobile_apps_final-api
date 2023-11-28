require "test_helper"

class PropertyImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_image = property_images(:one)
  end

  test "should get index" do
    get property_images_url, as: :json
    assert_response :success
  end

  test "should create property_image" do
    assert_difference("PropertyImage.count") do
      post property_images_url, params: { property_image: { image: @property_image.image, property_id: @property_image.property_id } }, as: :json
    end

    assert_response :created
  end

  test "should show property_image" do
    get property_image_url(@property_image), as: :json
    assert_response :success
  end

  test "should update property_image" do
    patch property_image_url(@property_image), params: { property_image: { image: @property_image.image, property_id: @property_image.property_id } }, as: :json
    assert_response :success
  end

  test "should destroy property_image" do
    assert_difference("PropertyImage.count", -1) do
      delete property_image_url(@property_image), as: :json
    end

    assert_response :no_content
  end
end
