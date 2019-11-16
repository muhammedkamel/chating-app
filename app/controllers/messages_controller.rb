# frozen_string_literal: true

class MessagesController < ApplicationController
  # GET applications/:application_id/chats/:chat_id/messages
  def index
    @messages = Application.find_by(key: params[:application_id]).chats.find_by(number: params[:chat_id]).messages.all
    json_response(@messages)
  end

  # POST applications/:application_id/chats/:chat_id/messages
  def create
    @messages = Application.find_by(key: params[:application_id]).chats.find_by(number: params[:chat_id]).messages
    @last_message_num = @messages&.last&.number.nil? ? 0 : @messages&.last&.number
    @message = @messages.create!(content: message_params[:content], number: @last_message_num + 1)
    json_response(@message, :created)
  end

  # GET applications/:application_id/chats/:chat_id/messages/:id
  def show
    @message = Application.find_by(key: params[:application_id]).chats.find_by(number: params[:chat_id]).messages.find_by(number: params[:id])
    json_response(@message)
  end

  # PUT applications/:application_id/chats/:chat_id/messages/:id
  def update
    Application.find_by(key: params[:application_id]).chats.find_by(number: params[:chat_id]).messages.where(number: params[:id]).update(message_params)
    head :no_content
  end

  def message_params
    params.permit(:content)
  end
end
