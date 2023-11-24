class Public::UsefulsController < ApplicationController
  def create
    post_review = PostReview.find(params[:post_review_id])
    useful = current_end_user.usefuls.new(post_review_id: post_review.id)
    useful.save
    redirect_to post_review_path(post_review)
  end

  def destroy
    post_review = PostReview.find(params[:post_review_id])
    useful = current_end_user.usefuls.find_by(post_review_id: post_review.id)
    useful.destroy
    redirect_to post_review_path(post_review)
  end
end
