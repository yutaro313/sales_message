class Customer::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    post = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: post.id)
    favorite.save
    redirect_to customer_post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to customer_post_path(post)
  end

end
