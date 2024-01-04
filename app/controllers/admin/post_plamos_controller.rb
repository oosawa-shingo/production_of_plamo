class Admin::PostPlamosController < ApplicationController
  def index
    @post_plamos = PostPlamo.page(params[:page]).per(10)
  end

  def show
    @post_plamo = PostPlamo.find(params[:id])
  end

  def destroy
    post_plamo = PostPlamo.find(params[:id])
    post_plamo.destroy
    redirect_to admin_post_plamos_path
  end
end
