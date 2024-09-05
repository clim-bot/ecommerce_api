# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user

  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true

  enum status: { pending: 'pending', completed: 'completed', cancelled: 'cancelled' }
end
