class Public::PostReviewsController < ApplicationController
  def new
    @post_review = PostReview.new
  end

  def create
    @post_review = PostReview.new(post_review_params)
    @post_review.end_user_id = current_end_user.id
    if @post_review.save
      redirect_to post_reviews_path
    else
      render :new
    end
  end

  def edit
    @post_review = PostReview.find(params[:id])
  end

  def update
    post_review = PostReview.find(params[:id])
    post_review.update(post_review_params)
    redirect_to post_review_path(post_review.id)
  end

  def index
    @post_reviews = PostReview.all
  end

  def show
    @post_review = PostReview.find(params[:id])
  end

  def destroy
    post_review = PostReview.find(params[:id])
    post_review.destroy
    redirect_to post_reviews_path
  end

  private

  def post_review_params
    params.require(:post_review).permit(:title, :review_item, :feeling, :review_item_image)
  end
end
