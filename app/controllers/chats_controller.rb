# frozen_string_literal: true

class ChatsController < ApplicationController
  # GET applications/:application_id/chats
  def index
    @chats = Application.find_by(key: params[:application_id]).chats.all
    json_response(@chats)
  end

  # POST applications/:application_id/chats
  def create
    @chats = Application.find_by(key: params[:application_id]).chats
    # @todo don't make query twice
    @last_chat_num = @chats&.last&.number.nil? ? 0 : @chats&.last&.number
    @chat = @chats.create!(number: @last_chat_num + 1)
    json_response(@chat, :created)
  end

  # GET applications/:application_id/chats/:id
  def show
    @chat = Application.find_by(key: params[:application_id]).chats.find_by(number: params[:id])
    json_response(@chat)
  end

  #   # PUT applications/:application_id/chats/:id
  #   def update
  #     Application.find_by(key: params[:application_id]).chats.where(number: params[:id]).update(chat_params)
  #     head :no_content
  #   end
end
