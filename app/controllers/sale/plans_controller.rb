class Sale::PlansController < ApplicationController

  def new
    @plan = Plan.new
  end

  def create
    @customer = Customer.find(params[:to_id])
    @plan = current_sale.plans.new(plan_plan)
    @plan.to_id = current_sale.id

    @plan.save
    redirect_to sale_customer_plan_index_path(@customer)

  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = current_sale.plans.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:to_id])
    @plan = current_sale.plans.find(params[:id])
    @plan.update(params_plan)
    redirect_to sale_customer_plan_index_path(@customer)
  end

  def destroy
    @customer = Customer.find(params[:to_id])
    @plans = current_customer.plans.find(params[:id])
    @plans.destroy
    redirect_to sale_customer_plan_index_path(@customer)
  end

  private

  def params_plan
    params.require(:plan).permit(:title, :start_data, :end_data, :to_id)
  end
end
