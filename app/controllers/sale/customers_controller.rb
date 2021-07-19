class Sale::CustomersController < ApplicationController


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

    @plan = Plan.new
  end

private

  def params_customer
    params.require(:customer).permit(:customer_detail)

  end

end
