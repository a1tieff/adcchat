require 'test_helper'

class CoversationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coversation = coversations(:one)
  end

  test "should get index" do
    get coversations_url
    assert_response :success
  end

  test "should get new" do
    get new_coversation_url
    assert_response :success
  end

  test "should create coversation" do
    assert_difference('Coversation.count') do
      post coversations_url, params: { coversation: { description: @coversation.description, title: @coversation.title } }
    end

    assert_redirected_to coversation_url(Coversation.last)
  end

  test "should show coversation" do
    get coversation_url(@coversation)
    assert_response :success
  end

  test "should get edit" do
    get edit_coversation_url(@coversation)
    assert_response :success
  end

  test "should update coversation" do
    patch coversation_url(@coversation), params: { coversation: { description: @coversation.description, title: @coversation.title } }
    assert_redirected_to coversation_url(@coversation)
  end

  test "should destroy coversation" do
    assert_difference('Coversation.count', -1) do
      delete coversation_url(@coversation)
    end

    assert_redirected_to coversations_url
  end
end
