class Sale::PostsController < ApplicationController

  def index
    # 後でcustomerごとに表示変える(where)
    @posts = Post.all
    @sale = current_sale.profile
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
    @post = Post.find(params[:id])
    @sale = current_sale.profile
    @post_comment = PostComment.new
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sale_posts_path
  end


  private

  def post_params
    params.require(:post).permit(:post_title, :post_image, :introduction)
  end

end