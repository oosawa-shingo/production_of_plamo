class Public::PostCommentsController < ApplicationController
  def create
    post_plamo = PostPlamo.find(params[:post_plamo_id])
    comment = current_end_user.post_comments.new(post_comment_params)
    comment.post_plamo_id = post_plamo.id
    comment.save
    redirect_to post_plamo_path(post_plamo)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_plamo_path(params[:post_plamo_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
