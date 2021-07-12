class Customer::PostsController < ApplicationController

  def index
    # 後にそれぞれのやつを表示
    @posts = Post.all
    @sale = Profile.all
  end

  def show
  end

end
