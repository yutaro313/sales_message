class Customer::PostsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @posts = Post.where(customer_id: current_customer.id)
    @profile = Profile.first
  end

  def show
    @post = Post.find_by(id: params[:id])
    @post_customer = @post.customer
    @sale = Profile.first
    @post_comment = PostComment.new
    if @post == nil
      redirect_to action: 'index'
    end
  end

end
