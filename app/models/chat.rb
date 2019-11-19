# frozen_string_literal: true

class Chat < ApplicationRecord
  validates :number, presence: true
  validates_associated :application

  belongs_to :application
  has_many :messages, dependent: :destroy

  def self.get_all(application_id)
    Application.find_by(key: application_id)&.chats&.all&.as_json(:except => :id)
  end

  def self.create_chat(application_id)
    @chats = Application.find_by(key: application_id)&.chats
    return if @chats.nil?

    @last_chat_num = @chats&.last&.number
    @last_chat_num = @last_chat_num.nil? ? 0 : @last_chat_num
    @last_chat_num += 1

    @chat = @chats.create!(number: @last_chat_num)

    # @todo find a smarter way to update the chats_count
    @chats[0].application.chats_count = @last_chat_num
    @chats[0].application.save

    @chat.as_json(:except => :id)
  end

  def self.get_by_number(application_id, chat_number)
    Application.find_by(key: application_id)&.chats&.find_by(number: chat_number)&.as_json(:except => :id)
  end
end
