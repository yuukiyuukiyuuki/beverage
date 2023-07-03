class Public::MessagesController < ApplicationController
  before_action :authenticate_customer!, :only => [:create]

  def create
    if Entry.where(:customer_id => current_customer.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:message,:customer_id, :content, :room_id).merge(:customer_id => current_customer.id))
      redirect_to room_path(@message.room)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
