# frozen_string_literal: true

class ProductsController < ApplicationController
  # Allow unauthenticated access to index and show actions
  skip_before_action :authorize_request, only: %i[index show]

  before_action :set_product, only: %i[show update destroy]

  def index
    products = Product.all
    render json: products, each_serializer: ProductSerializer, status: :ok
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: :created
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @product, serializer: ProductSerializer, status: :ok
  end

  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end
end
