class ProcessMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    response_message = message.conversation.messages.create role: "assistant"

    client = OpenAI::Client.new

    response_message.response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: message.conversation.messages.where("id <= ?", message.id).map { |message|
            { role: message.role, content: message.content }
          }, # Required.
      }
    )

    if response_message.response["error"]
      response_message.failed!
    else
      response_message.content = response_message.response.dig("choices", 0, "message", "content")
      response_message.completed!
    end
  rescue
    response_message.failed!
  end
end
