require 'test_helper'

class ReplicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @replica = replicas(:one)
  end

  test "should get index" do
    get replicas_url
    assert_response :success
  end

  test "should get new" do
    get new_replica_url
    assert_response :success
  end

  test "should create replica" do
    assert_difference('Replica.count') do
      post replicas_url, params: { replica: { position: @replica.position, timeout: @replica.timeout, type: @replica.type } }
    end

    assert_redirected_to replica_url(Replica.last)
  end

  test "should show replica" do
    get replica_url(@replica)
    assert_response :success
  end

  test "should get edit" do
    get edit_replica_url(@replica)
    assert_response :success
  end

  test "should update replica" do
    patch replica_url(@replica), params: { replica: { position: @replica.position, timeout: @replica.timeout, type: @replica.type } }
    assert_redirected_to replica_url(@replica)
  end

  test "should destroy replica" do
    assert_difference('Replica.count', -1) do
      delete replica_url(@replica)
    end

    assert_redirected_to replicas_url
  end
end
