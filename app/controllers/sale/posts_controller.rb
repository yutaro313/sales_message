class Sale::PostsController < ApplicationController
  before_action :authenticate_sale!

  def index
    @posts = Post.where(params[:customer_id])
    @sale = current_sale.profile
  end

  def new
    @post = Post.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @post = Post.new(post_params)
    @post.customer_id = @customer.id
    @post.sale_id = current_sale.id
    if @post.save
      flash[:notice] = "投稿されました"
      redirect_to sale_customer_post_index_path(@customer)
    else
      flash[:alert] = "入力不足があります"
      redirect_to sale_customer_post_index_path(@customer)
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_customer = @post.customer
    @sale = Profile.first
    @post_comment = PostComment.new
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to sale_posts_path
  end


  private

  def post_params
    params.require(:post).permit(:post_title, :post_image, :introduction, :customer_id)
  end

end