require 'test_helper'

class ManeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maney = maneys(:one)
  end

  test "should get index" do
    get maneys_url
    assert_response :success
  end

  test "should get new" do
    get new_maney_url
    assert_response :success
  end

  test "should create maney" do
    assert_difference('Maney.count') do
      post maneys_url, params: { maney: { category_id: @maney.category_id, content: @maney.content, integer: @maney.integer, price: @maney.price, user_id: @maney.user_id } }
    end

    assert_redirected_to maney_url(Maney.last)
  end

  test "should show maney" do
    get maney_url(@maney)
    assert_response :success
  end

  test "should get edit" do
    get edit_maney_url(@maney)
    assert_response :success
  end

  test "should update maney" do
    patch maney_url(@maney), params: { maney: { category_id: @maney.category_id, content: @maney.content, integer: @maney.integer, price: @maney.price, user_id: @maney.user_id } }
    assert_redirected_to maney_url(@maney)
  end

  test "should destroy maney" do
    assert_difference('Maney.count', -1) do
      delete maney_url(@maney)
    end

    assert_redirected_to maneys_url
  end
end
