# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Order Management', type: :request do
  let!(:user) { User.create!(name: 'John Doe', email: 'john@example.com', password: 'password123') }
  let!(:token) { JsonWebToken.encode(user_id: user.id) }
  let!(:product1) { Product.create!(name: 'Laptop', description: 'A high-end laptop', price: 1200.00, inventory: 10) }
  let!(:product2) do
    Product.create!(name: 'Headphones', description: 'Noise-cancelling headphones', price: 200.00, inventory: 15)
  end
  let!(:cart) { user.create_cart }
  let!(:cart_item1) { CartItem.create!(cart:, product: product1, quantity: 1) }
  let!(:cart_item2) { CartItem.create!(cart:, product: product2, quantity: 2) }

  describe 'POST /orders' do
    it 'places an order for the items in the cart' do
      post '/orders', headers: { 'Authorization' => "Bearer #{token}" }

      expect(response).to have_http_status(:created)
      json_response = JSON.parse(response.body)
      expect(json_response['total_price']).to eq('1600.0')
      expect(json_response['status']).to eq('pending')
    end
  end
end
