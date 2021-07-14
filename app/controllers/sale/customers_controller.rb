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

  private

  def params_customer
    params.require(:customer).permit(:customer_detail)

  end

end
