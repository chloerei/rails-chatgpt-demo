class Message < ApplicationRecord
  belongs_to :conversation

  enum role: {
    user: 0,
    assistant: 1
  }

  enum status: {
    pending: 0,
    completed: 1,
    failed: 2
  }

  broadcasts_to ->(message) { [ message.conversation, :messages ] }, partial: "messages/message"
end
