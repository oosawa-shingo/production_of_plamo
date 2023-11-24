class Public::FavoritesController < ApplicationController
  def create
    post_plamo = PostPlamo.find(params[:post_plamo_id])
    favorite = current_end_user.favorites.new(post_plamo_id: post_plamo.id)
    favorite.save
    redirect_to post_plamo_path(post_plamo)
  end

  def destroy
    post_plamo = PostPlamo.find(params[:post_plamo_id])
    favorite = current_end_user.favorites.find_by(post_plamo_id: post_plamo.id)
    favorite.destroy
    redirect_to post_plamo_path(post_plamo)
  end
end
