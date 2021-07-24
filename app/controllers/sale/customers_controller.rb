class Sale::CustomersController < ApplicationController
  before_action :authenticate_sale!


  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(params_customer)
    redirect_to sale_customer_path(@customer.id)
  end

  def post_index
    @customer = Customer.find(params[:customer_id])
    @posts = Post.where(sale_id: current_sale.id, customer_id: @customer.id)
    @sale = current_sale.profile
    @post = Post.new
  end

  def plan_index
    @customer = Customer.find(params[:customer_id])
    @plans = Plan.where(to_id: @customer.id,  from_id: current_sale.id)
    @sale = current_sale.profile
    @plan = Plan.new
  end

  def message_index
    @customer = Customer.find(params[:customer_id])
    @sale_profile = current_sale.profile
    @message = Message.new
    @messages = Message.where("(to_id = ? AND from_id = ? AND is_from_sale = 1) OR (to_id = ? AND from_id = ? AND is_from_sale = 0)",@customer.id,current_sale.id,current_sale.id,@customer.id).order("created_at ASC")
    # 本番環境ではtrueやfalseの方が良い。今回はmysqlのため0か1で区別している
  end

private

  def params_customer
    params.require(:customer).permit(:customer_detail)

  end

end
