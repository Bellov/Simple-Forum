require 'test_helper'

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get demo_index_url
    assert_response :success
  end

  test "should get test" do
    get demo_test_url
    assert_response :success
  end

  test "should get store" do
    get demo_store_url
    assert_response :success
  end

  test "should get delete" do
    get demo_delete_url
    assert_response :success
  end

  test "should get remove" do
    get demo_remove_url
    assert_response :success
  end

end
