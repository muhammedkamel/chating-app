class Chat < ApplicationRecord
  validates :number, presence: true
  validates_associated :application

  belongs_to :application
  has_many :messages, dependent: :destroy
end
