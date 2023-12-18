class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(current_end_user.id)
  end

  def edit
    @end_user = EndUser.find(current_end_user.id)
  end

  def update
    @end_user = EndUser.find(current_end_user.id)
    @end_user.update(end_user_params)
    redirect_to end_users_my_page_path(end_user_params)
  end

  def plamos
    @post_plamos = current_end_user.post_plamos.all
  end

  def reviews
    @post_reviews = current_end_user.post_reviews.all
  end

  def comments
    @post_comments = current_end_user.post_comments.all
  end

  def confirm
    @end_user = EndUser.find(current_end_user.id)
  end

  def withdrawn
    @end_user = EndUser.find(current_end_user.id)
    @end_user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def favorites
    @end_user = EndUser.find(current_end_user.id)
    favorites = Favorite.where(end_user_id: @end_user.id).pluck(:post_plamo_id)
    @favorite_posts = PostPlamo.find(favorites)
  end

  def usefuls
    @end_user = EndUser.find(current_end_user.id)
    usefuls = Useful.where(end_user_id: @end_user.id).pluck(:post_review_id)
    @useful_posts = PostReview.find(usefuls)
  end

   private

  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :profile_image, :email)
  end
end
