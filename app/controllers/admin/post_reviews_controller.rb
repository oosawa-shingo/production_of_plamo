class Admin::PostReviewsController < ApplicationController
  def index
    @post_reviews = PostReview.page(params[:page]).per(10)
  end

  def show
    @post_review = PostReview.find(params[:id])
  end

  def destroy
    post_review = PostReview.find(params[:id])
    post_review.destroy
    redirect_to admin_post_reviews_path
  end
end
