class Customer::PostsController < ApplicationController

  def index
    # 後にそれぞれのやつを表示
    @posts = Post.all
    @profile = Profile.first
  end

  def show
    @post = Post.find(params[:id])
    @sale = Profile.first
    @post_comment = PostComment.new
  end

end
