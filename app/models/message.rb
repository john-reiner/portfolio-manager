class Message < ApplicationRecord
  belongs_to :portfolio
  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true
end
