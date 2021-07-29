class Sale::ProfilesController < ApplicationController
  before_action :authenticate_sale!

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
    if @profile.update(profile_params)
      flash[:notice] = "プロフィールを変更しました"
      redirect_to sale_profiles_path
    else
      flash.now[:alert] = "入力不足があります"
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :birthplace, :hobby, :recent_event, :a_word, :phone_number, :profile_image)
  end


end
