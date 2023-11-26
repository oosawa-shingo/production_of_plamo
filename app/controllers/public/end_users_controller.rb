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
    @post_plamo = PostPlamo.find(current_end_user.id)
  end

   private

  def end_user_params
    params.require(:end_user).permit(:name, :introduction)
  end
end
