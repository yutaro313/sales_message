class Sale::PostsController < ApplicationController

  def index
    # 後でcustomerごとに表示変える(where)
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.sale_id = current_sale.id
    @post.save
    redirect_to sale_posts_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def post_params
    params.require(:post).permit(:post_title, :post_image, :introduction)
  end

end
