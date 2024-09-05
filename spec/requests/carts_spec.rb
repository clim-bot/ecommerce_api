# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cart Management', type: :request do
  let!(:user) { User.create!(name: 'John Doe', email: 'john@example.com', password: 'password123') }
  let!(:token) { JsonWebToken.encode(user_id: user.id) }
  let!(:product1) { Product.create!(name: 'Laptop', description: 'A high-end laptop', price: 1200.00, inventory: 10) }
  let!(:product2) do
    Product.create!(name: 'Headphones', description: 'Noise-cancelling headphones', price: 200.00, inventory: 15)
  end

  describe 'GET /cart' do
    let!(:cart) { user.create_cart }
    let!(:cart_item1) { CartItem.create!(cart:, product: product1, quantity: 1) }

    it "retrieves the user's cart" do
      get '/cart', headers: { 'Authorization' => "Bearer #{token}" }

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['cart_items'].length).to eq(1)
      expect(json_response['cart_items'][0]['product']['name']).to eq('Laptop')
    end
  end

  describe 'POST /cart/add_item/:product_id' do
    it 'adds an item to the cart' do
      post "/cart/add_item/#{product1.id}", headers: { 'Authorization' => "Bearer #{token}" }

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['cart_items'].length).to eq(1)
      expect(json_response['cart_items'][0]['product']['name']).to eq('Laptop')
    end
  end

  describe 'DELETE /cart/remove_item/:product_id' do
    let!(:cart) { user.create_cart }
    let!(:cart_item) { CartItem.create!(cart:, product: product1, quantity: 1) }

    it 'removes an item from the cart' do
      delete "/cart/remove_item/#{product1.id}", headers: { 'Authorization' => "Bearer #{token}" }

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['cart_items']).to be_empty
    end
  end
end
