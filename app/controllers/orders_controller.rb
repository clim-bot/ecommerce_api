# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_cart

  def create
    total_price = @cart.cart_items.sum { |item| item.quantity * item.product.price }
    order = current_user.orders.new(total_price:, status: 'pending')

    ActiveRecord::Base.transaction do
      order.save!
      @cart.cart_items.each do |item|
        item.product.update!(inventory: item.product.inventory - item.quantity)
        item.destroy!
      end
    end

    render json: order, status: :created
  rescue ActiveRecord::RecordInvalid
    render json: { error: 'Order could not be completed' }, status: :unprocessable_entity
  end

  private

  def set_cart
    @cart = current_user.cart
  end
end
