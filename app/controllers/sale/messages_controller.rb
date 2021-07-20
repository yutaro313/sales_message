class Sale::MessagesController < ApplicationController

  def create
    @customer = Customer.find(params[:customer_id])
    @message = Message.new(message_params)
    @message.from_id = current_sale.id
    @message.to_id = @customer.id
    @message.is_from_sale = true
    @message.save
    redirect_to sale_customer_message_index_path
  end

  private

  def message_params
    params.require(:message).permit(:content, :image)
  end

end
