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
      redirect_to sale_customer_message_index_path
    else
      flash[:alert] = "メッセージを入力してください"
      redirect_to sale_customer_message_index_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image)
  end

end
