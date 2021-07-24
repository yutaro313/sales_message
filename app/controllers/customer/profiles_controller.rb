class Customer::ProfilesController < ApplicationController
  before_action :authenticate_customer!

  def show
    @profile = Profile.first
    @sale = Sale.first
  end
end
