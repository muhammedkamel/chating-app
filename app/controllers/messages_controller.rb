# frozen_string_literal: true

# app/controllers/messages_controller.rb
# @todo add filteration and sanitization
class MessagesController < ApplicationController
  # GET applications/:application_id/chats/:chat_id/messages
  def index
    @messages = Message.get_all(params[:application_id], params[:chat_id])
    json_response(@messages)
  end

  # POST applications/:application_id/chats/:chat_id/messages
  def create
    @message = Message.create_message(params[:application_id], params[:chat_id], params[:content])
    json_response(@message, :created)
  end

  # GET applications/:application_id/chats/:chat_id/messages/:id
  def show
    @message = Message.get_by_number(params[:application_id], params[:chat_id], params[:id])
    json_response(@message)
  end

  # PUT applications/:application_id/chats/:chat_id/messages/:id
  def update
    Message.update_by_number(params[:application_id], params[:chat_id], params[:id], message_params)
    head :no_content
  end

  def message_params
    params.permit(:content)
  end
end
