require "test_helper"

class Admin::PostPlamosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_plamos_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_post_plamos_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_post_plamos_destroy_url
    assert_response :success
  end
end
