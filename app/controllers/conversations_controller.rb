class ConversationsController < ApplicationController
  def index
  end

  def create
    @conversation = Conversation.create
    redirect_to @conversation
  end

  def show
    @conversation = Conversation.find params[:id]
  end
end
