# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :inventory, :created_at, :updated_at

  # Ensure price is serialized as a number
  def price
    object.price.to_f
  end
end
