# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :price, :inventory, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :inventory, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :cart_items, dependent: :destroy
end
