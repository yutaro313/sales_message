class Customer::PlansController < ApplicationController
  before_action :authenticate_customer!

  def index
    @sale = Sale.first
    @plans = Plan.where(to_id: current_customer.id, from_id: @sale.id)
  end

  def new
    @plan = Plan.new
  end

  def create
    @sale = Sale.first
    # 勝手にto_idも入る
    @plan = current_customer.plans.new(params_plan)
    @plan.from_id = @sale.id
    @plan.action = 0
    if @plan.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to customer_plans_path
    else
      flash.now[:alert] = "入力不足があります"
      render :new
    end
  end

  def show
    @plan = Plan.find_by(id: params[:id])
    if @plan == nil
      redirect_to action: 'index'
    end
  end

  def edit
    @plan = current_customer.plans.find_by(id: params[:id])
    # 例外処理
    if @plan == nil
      redirect_to action: 'index'
    end
  end

  def update
    @plan = current_customer.plans.find(params[:id])
    @plan.update(params_plan)
    flash[:success] = "スケジュールを変更しました"
    redirect_to customer_plans_path
  end

  def destroy
    @plans = current_customer.plans.find(params[:id])
    @plans.destroy
    flash[:success] = "スケジュールを削除しました"
    redirect_to customer_plans_path
  end

  private

  def params_plan
    params.require(:plan).permit(:title, :start_date, :end_date, :to_id)
  end

end
