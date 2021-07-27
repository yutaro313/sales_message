class Sale::MessagesController < ApplicationController
  before_action :authenticate_sale!

  def create
    @customer = Customer.find(params[:customer_id])
    @message = Message.new(message_params)
    @message.from_id = current_sale.id
    @message.to_id = @customer.id
    @message.is_from_sale = true
    if @message.save
      flash[:notice] = "メッセージが送信されました"
      @customer = Customer.find(params[:customer_id])
      @message = Message.new
      @messages = Message.where("(to_id = ? AND from_id = ? AND is_from_sale = 1) OR (to_id = ? AND from_id = ? AND is_from_sale = 0)",@customer.id,current_sale.id,current_sale.id,@customer.id).order("created_at ASC")
    else
      flash[:alert] = "メッセージを入力してください"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image)
  end

end
