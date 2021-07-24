class Customer::PostsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @posts = Post.where(customer_id: current_customer.id)
    @profile = Profile.first
  end

  def show
    @post = Post.find(params[:id])
    @sale = Profile.first
    @post_comment = PostComment.new
  end

end
