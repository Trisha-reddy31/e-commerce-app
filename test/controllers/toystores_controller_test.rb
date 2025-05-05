require "test_helper"

class ToystoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toystore = toystores(:one)
  end

  test "should get index" do
    get toystores_url
    assert_response :success
  end

  test "should get new" do
    get new_toystore_url
    assert_response :success
  end

  test "should create toystore" do
    assert_difference("Toystore.count") do
      post toystores_url, params: { toystore: { brand: @toystore.brand, description: @toystore.description, name: @toystore.name, price: @toystore.price, toytype: @toystore.toytype } }
    end

    assert_redirected_to toystore_url(Toystore.last)
  end

  test "should show toystore" do
    get toystore_url(@toystore)
    assert_response :success
  end

  test "should get edit" do
    get edit_toystore_url(@toystore)
    assert_response :success
  end

  test "should update toystore" do
    patch toystore_url(@toystore), params: { toystore: { brand: @toystore.brand, description: @toystore.description, name: @toystore.name, price: @toystore.price, toytype: @toystore.toytype } }
    assert_redirected_to toystore_url(@toystore)
  end

  test "should destroy toystore" do
    assert_difference("Toystore.count", -1) do
      delete toystore_url(@toystore)
    end

    assert_redirected_to toystores_url
  end
end
