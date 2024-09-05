# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products Management', type: :request do
  let!(:user) { User.create!(name: 'John Doe', email: 'john@example.com', password: 'password123') }
  let!(:token) { JsonWebToken.encode(user_id: user.id) }

  describe 'GET /products' do
    let!(:product1) { Product.create!(name: 'Laptop', description: 'A high-end laptop', price: 1200.00, inventory: 10) }
    let!(:product2) do
      Product.create!(name: 'Headphones', description: 'Noise-cancelling headphones', price: 200.00, inventory: 15)
    end

    it 'retrieves a list of all products' do
      get '/products'

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
    end
  end

  describe 'POST /products' do
    it 'creates a new product' do
      post '/products', params: {
        product: {
          name: 'Keyboard',
          description: 'Mechanical keyboard',
          price: 150.00,
          inventory: 25
        }
      }, headers: { 'Authorization' => "Bearer #{token}" }

      expect(response).to have_http_status(:created)
      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq('Keyboard')
    end
  end

  describe 'PUT /products/:id' do
    let!(:product) { Product.create!(name: 'Mouse', description: 'Wireless mouse', price: 50.00, inventory: 100) }

    it 'updates a product' do
      put "/products/#{product.id}", params: {
        product: { price: 55.00 }
      }, headers: { 'Authorization' => "Bearer #{token}" }

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['price']).to eq(55.0)
    end
  end

  describe 'DELETE /products/:id' do
    let!(:product) { Product.create!(name: 'Mouse', description: 'Wireless mouse', price: 50.00, inventory: 100) }

    it 'deletes a product' do
      delete "/products/#{product.id}", headers: { 'Authorization' => "Bearer #{token}" }

      expect(response).to have_http_status(:no_content)
      expect(Product.exists?(product.id)).to be_falsey
    end
  end
end
