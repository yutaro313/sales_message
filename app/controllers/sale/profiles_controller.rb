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

  private

  def params_profile
    params.require(:profile).permit(:name, :birthplace, :hobby, :recent_event, :a_word, :phone_number, :email, :profile_image)
  end

end
