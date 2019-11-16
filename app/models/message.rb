class Message < ApplicationRecord
  belongs_to :chat
  validates :number, :content, presence: true
  validates_associated :chat
end
