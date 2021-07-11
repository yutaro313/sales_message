class Sale::ProfilesController < ApplicationController

  def show
    @profile = current_sale.profile
    @sale = current_sale
  end

  def edit
    @sale = current_sale
    @profile = current_sale.profile
  end

  def update
    @profile = current_sale.profile
    if @profile.update
      redirect_to sale_profiles_path
    else
      render :edit
    end
  end


end
