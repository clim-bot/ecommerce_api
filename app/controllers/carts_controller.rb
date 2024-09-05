# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart

  def show
    render json: @cart, include: { cart_items: { include: :product } }, status: :ok
  end

  def add_item
    product = Product.find(params[:product_id])
    item = @cart.cart_items.find_or_initialize_by(product:)
    item.quantity += 1
    item.save!
    render json: @cart, include: { cart_items: { include: :product } }, status: :ok
  end

  def remove_item
    item = @cart.cart_items.find_by(product_id: params[:product_id])
    if item
      item.destroy
      render json: @cart, include: { cart_items: { include: :product } }, status: :ok
    else
      render json: { error: 'Item not found' }, status: :not_found
    end
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
