# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Authentication', type: :request do
  describe 'POST /register' do
    it 'registers a new user' do
      post '/register', params: {
        user: {
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123'
        }
      }

      expect(response).to have_http_status(:created)
      json_response = JSON.parse(response.body)
      expect(json_response).to include('token')
    end
  end

  describe 'POST /login' do
    let!(:user) { User.create!(name: 'John Doe', email: 'john@example.com', password: 'password123') }

    it 'authenticates a user and returns a JWT token' do
      post '/login', params: {
        email: 'john@example.com',
        password: 'password123'
      }

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response).to include('token')
    end

    it 'returns unauthorized for invalid credentials' do
      post '/login', params: {
        email: 'john@example.com',
        password: 'wrongpassword'
      }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
