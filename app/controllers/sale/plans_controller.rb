class Sale::PlansController < ApplicationController
  before_action :authenticate_sale!

  def new
    @plan = Plan.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @plan = @customer.plans.build(params_plan)
    @plan.from_id = current_sale.id
    @plan.to_id = @customer.id
    @plan.action = 1
    if @plan.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to sale_customer_plan_index_path(@customer)
    else
      flash[:alert] = "入力不足があります"
      redirect_to sale_customer_plan_index_path(@customer)
    end

  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update(params_plan)
    flash[:success] = "スケジュールへ変更しました"
    redirect_to sale_customer_plan_index_path(@plan.customer)
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:success] = "スケジュールを削除しました"
    redirect_to sale_customer_plan_index_path(@plan.customer)
  end

  private

  def params_plan
    params.require(:plan).permit(:title, :start_date, :end_date, :from_id)
  end
end
