class Customer::PlansController < ApplicationController

  def index
    @plans = Plan.where(to_id: current_customer.id)
  end

  def new
    @plan = Plan.new
  end

  def create
    # 勝手にto_idも入る
    @plan = current_customer.plans.new(params_plan)
    @plan.save
    redirect_to customer_plans_path
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = current_customer.plans.find(params[:id])
  end

  def update
    @plan = current_customer.plans.find(params[:id])
    @plan.update(params_plan)
    redirect_to customer_plans_path
  end

  def destroy
    @plans = current_customer.plans.find(params[:id])
    @plans.destroy
    redirect_to customer_plans_path
  end

  private

  def params_plan
    params.require(:plan).permit(:title, :start_date, :end_date, :to_id)
  end

end
