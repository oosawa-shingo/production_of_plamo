class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(current_end_user.id)
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def withdrawn
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
    params.require(:end_user).permit(:name, :introduction)
  end
end
