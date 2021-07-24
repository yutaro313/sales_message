class Customer::PostCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    post = Post.find(params[:post_id])
    @post_comment = current_customer.post_comments.new(post_comment_params)
    @post_comment.post_id = params[:post_id]
    @post_comment.action = 1
    if @post_comment.save
      redirect_to customer_post_path(post)
    else
      redirect_to customer_post_path(post)
    end
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to customer_post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
