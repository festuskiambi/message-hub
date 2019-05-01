class Message < ApplicationRecord
  validates :originator, :recipient, presence: true
  validates :content, length: { maximum: 256 }
end
