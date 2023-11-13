require "test_helper"

class Admin::PostReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_post_reviews_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_post_reviews_destroy_url
    assert_response :success
  end
end
