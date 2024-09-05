# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Health Check', type: :request do
  describe 'GET /health' do
    it "returns a successful response with status 'OK'" do
      get '/health'

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq('OK')
      expect(json_response['message']).to eq('API is up and running!')
    end
  end
end
