class MessagesController < ApplicationController
  def show
    #@message = Message.find(params[:id])
    @message = Message.find_by_hashid(params[:id])
    if @message.delaydelete == false
      destroy
    end
  end

  def destroy
    @message.destroy
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = "You link here => #{message_path(@message)}"
      redirect_to messages_path
    end
  end

  private def message_params
    params.require(:message).permit(:message, :delaydelete)
  end

end
