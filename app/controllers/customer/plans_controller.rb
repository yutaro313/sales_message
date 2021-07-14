class Customer::PlansController < ApplicationController

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params_plan)
    @plan.save(params_plan)
    redirect_to customer_plans_path
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

  def params_plan
    # require消している
    params.permit(:title, :start_date, :end_date)
  end

end
