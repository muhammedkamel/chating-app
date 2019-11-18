# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :chat
  validates :number, :content, presence: true
  validates_associated :chat

  def self.get_all(application_id, chat_number)
    Application.find_by(key: application_id)&.chats&.find_by(number: chat_number)&.messages&.all
  end

  def self.create_message(application_id, chat_number, content)
    @messages = Application.find_by(key: application_id)&.chats&.find_by(number: chat_number)&.messages
    return if @messages.nil?

    @last_message_num = @messages&.last&.number
    @last_message_num = @last_message_num.nil? ? 0 : @last_message_num
    @last_message_num += 1

    @message = @messages.create!(content: content, number: @last_message_num)

    # @todo find a smarter way to update the messages_count
    @messages[0].chat.messages_count = @last_message_num
    @messages[0].chat.save

    @message
  end

  def self.get_by_number(application_id, chat_number, message_number)
    Application.find_by(key: application_id)&.chats&.find_by(number: chat_number)&.messages&.find_by(number: message_number)
  end

  def self.update_by_number(application_id, chat_number, message_number, message)
    Application.find_by(key: application_id)&.chats&.find_by(number: chat_number)&.messages&.where(number: message_number)&.update(message)
  end
end
