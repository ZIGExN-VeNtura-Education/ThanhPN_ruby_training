class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, length: {maximum: 140}, presence: true
end

# model luon so it (not s)
# controller luon so nhieu (s)
