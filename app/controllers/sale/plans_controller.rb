class Sale::PlansController < ApplicationController

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    Plan.create(plan_params)
    redirect_to sale_plans_path
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

  def plan_params
    params.require(:plan).permit(:title, :start_data, :end_data)
  end
end
