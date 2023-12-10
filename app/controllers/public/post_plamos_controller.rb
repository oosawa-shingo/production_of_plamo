class Public::PostPlamosController < ApplicationController
  def new
    @post_plamo = PostPlamo.new
  end

  def create
    @post_plamo = PostPlamo.new(post_plamo_params)
    @post_plamo.end_user_id = current_end_user.id
    if @post_plamo.save
      redirect_to post_plamos_path
    else
      render :new
    end
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
    if params[:new_post_plamo]
      @post_plamos = PostPlamo.new_post
    elsif params[:old_post_plamo]
      @post_plamos = PostPlamo.old_post
    else
      @post_plamos = params[:tag_id].present? ? Tag.find(params[:tag_id]).post_plamos : PostPlamo.all
    end
    if params[:keyword]
      @post_plamos = @post_plamos.search(params[:keyword]).page(params[:page])
    else
      @post_plamos = @post_plamos.page(params[:page])
    end
    @keyword = params[:keyword]
  end

  def show
    @post_plamo = PostPlamo.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_plamo = PostPlamo.find(params[:id])
    post_plamo.destroy
    redirect_to post_plamos_path
  end

  private

  def post_plamo_params
    params.require(:post_plamo).permit(:title, :introduction, plamo_images: [], tag_ids: [])
  end
end
