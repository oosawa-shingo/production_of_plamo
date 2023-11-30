class Admin::PostPlamosController < ApplicationController

  def show
    @post_plamo = PostPlamo.find(params[:id])
  end

  def destroy
    post_plamo = PostPlamo.find(params[:id])
    post_plamo.destroy
    redirect_to post_plamos_path
  end
end
