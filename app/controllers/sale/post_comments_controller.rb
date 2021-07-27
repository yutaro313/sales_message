class Sale::PostCommentsController < ApplicationController
  before_action :authenticate_sale!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_sale.post_comments.new(post_comment_params)
    @post_comment.post_id = params[:post_id]
    @post_customer = @post.customer
    @sale = Profile.first
    # @post_comment = PostComment.new(post_comment_params)
    @post_comment.action = 0
    if @post_comment.save
      flash[:notice] = "投稿にコメントしました"
    else
      flash[:alert] = "コメントを入力してください"
    end
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    @post = Post.find(params[:post_id])
    @sale = Profile.first
    @post_customer = @post.customer
    flash[:notice] = "コメントを削除しました"
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
