# frozen_string_literal: true

# app/controllers/chats_controller.rb
# @todo add filteration and sanitization
class ChatsController < ApplicationController
  # GET applications/:application_id/chats
  def index
    @chats = Chat.get_all(params[:application_id])
    json_response(@chats)
  end

  # POST applications/:application_id/chats
  def create
    @chat = Chat.create_chat(params[:application_id])
    json_response(@chat, :created)
  end

  # GET applications/:application_id/chats/:id
  def show
    @chat = Chat.get_by_number(params[:application_id], params[:id])
    json_response(@chat)
  end
end
