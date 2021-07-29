class Customer::MessagesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @sale = Sale.first
    @sale_profile = @sale.profile
    @message = Message.new
    @messages = Message.where("(to_id = ? AND from_id = ? AND is_from_sale=1) OR (to_id = ? AND from_id = ? AND is_from_sale=0)",current_customer.id,@sale.id,@sale.id,current_customer.id).order("created_at ASC")
  end

  def create
    @sale = Sale.first
    @message = Message.new(message_params)
    @message.from_id = current_customer.id
    @message.to_id = @sale.id
    @message.is_from_sale = false
    if @message.save
      @message = Message.new(message_params)
      @sale = Sale.first
      @messages = Message.where("(to_id = ? AND from_id = ? AND is_from_sale=1) OR (to_id = ? AND from_id = ? AND is_from_sale=0)",current_customer.id,@sale.id,@sale.id,current_customer.id).order("created_at ASC")
      flash[:notice] = "メッセージが送信されました"
    else
      flash[:alert] = "メッセージを入力してください"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image)
  end

end