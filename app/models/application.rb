class Application < ApplicationRecord
  has_secure_token :key

  validates :key, :name, presence: true
  validates :key, uniqueness: true

end
