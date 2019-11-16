class Chat < ApplicationRecord
  belongs_to :application
  validates :number, presence: true
  validates_associated :application
end
