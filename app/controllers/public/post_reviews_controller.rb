class Public::PostReviewsController < ApplicationController
  before_action :authenticate_end_user!, except: [:index]
  before_action :is_matching_login_user, only: [:edit, :update]
  def new
    @post_review = PostReview.new
  end

  def create
    @post_review = PostReview.new(post_review_params)
    @post_review.end_user_id = current_end_user.id
    if @post_review.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to post_reviews_path
    else
      flash.now[:alert] = "投稿に失敗しました。"
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
    @post_reviews = PostReview.page(params[:page]).per(8)
    if params[:keyword]
      @post_reviews = @post_reviews.search(params[:keyword]).page(params[:page])
    else
      @post_reviews = @post_reviews.page(params[:page]).per(8)
    end
    @keyword = params[:keyword]
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
    params.require(:post_review).permit(:title, :review_item, :feeling, review_images: [])
  end

  def is_matching_login_user
    end_user = EndUser.find(params[:id])
    unless end_user.id == current_end_user.id
      redirect_to post_reviews_path
    end
  end
end
