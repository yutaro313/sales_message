class Customer::ProfilesController < ApplicationController

  def show
    # 後で1にする
    @profile = Profile.find(2)
    @sale = Sale.find(2)
  end
end
