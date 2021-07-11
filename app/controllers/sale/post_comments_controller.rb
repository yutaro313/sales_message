class Sale::PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_sale.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to sale_post_path(post)
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to sale_posts_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :attribute)
  end

end
