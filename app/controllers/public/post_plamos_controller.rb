class Public::PostPlamosController < ApplicationController
  def new
    @post_plamo = PostPlamo.new
  end

  def create
    @post_plamo = PostPlamo.new(post_plamo_params)
    @post_plamo.end_user_id = current_end_user.id
    @post_plamo.save
    redirect_to post_plamos_path
  end

  def edit
    @post_plamo = PostPlamo.find(params[:id])
  end

  def update
    post_plamo = PostPlamo.find(params[:id])
    post_plamo.update(post_plamo_params)
    redirect_to post_plamo_path(post_plamo.id)
  end

  def index
    @post_plamos = PostPlamo.all
  end

  def show
    @post_plamo = PostPlamo.find(params[:id])
  end

  def destroy
  end

  def post_plamo_params
    params.require(:post_plamo).permit(:title, :introduction, :image)
  end
end
