class Application < ApplicationRecord
  has_secure_token :key

  validates :name, presence: true
  validates :key, uniqueness: true

  has_many :chats, dependent: :destroy
end
