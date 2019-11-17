# frozen_string_literal: true

class Chat < ApplicationRecord
  validates :number, presence: true
  validates_associated :application

  belongs_to :application
  has_many :messages, dependent: :destroy

  def self.get_all(application_id)
    Application.find_by(key: application_id).chats.all
  end

  def self.create_chat(application_id)
    @chats = Application.find_by(key: application_id).chats
    @last_chat_num = @chats&.last&.number
    @last_chat_num = @last_chat_num.nil? ? 0 : @last_chat_num
    @chats.create!(number: @last_chat_num + 1)
  end

  def self.get_by_number(application_id, chat_number)
    Application.find_by(key: application_id).chats.find_by(number: chat_number)
  end
end
