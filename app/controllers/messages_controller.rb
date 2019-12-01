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
    @message.save
    redirect_to messages_path
    #redirect_to @message
    # render plain: params[:message].inspect
    # render plain: message_params.inspect
  end

  private def message_params
    params.require(:message).permit(:message, :delaydelete)
  end

end
