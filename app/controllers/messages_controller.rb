class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find params[:conversation_id]
    @message = @conversation.messages.create message_params
    ProcessMessageJob.perform_later(@message)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
