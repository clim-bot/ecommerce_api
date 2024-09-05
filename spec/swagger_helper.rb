# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = "#{Rails.root}/swagger"

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'eCommerce API V1',
        version: 'v1',
        description: 'API documentation for eCommerce platform.'
      },
      paths: {},
      components: {
        securitySchemes: {
          bearerAuth: {
            type: :http,
            scheme: :bearer,
            bearerFormat: :JWT
          }
        },
        schemas: {
          Product: {
            type: :object,
            properties: {
              id: { type: :integer, example: 1 },
              name: { type: :string, example: 'Laptop' },
              description: { type: :string, example: 'A high-end gaming laptop' },
              price: { type: :number, example: 1200.0 },
              inventory: { type: :integer, example: 5 },
              created_at: { type: :string, format: 'date-time' },
              updated_at: { type: :string, format: 'date-time' }
            }
          },
          User: {
            type: :object,
            properties: {
              id: { type: :integer, example: 1 },
              name: { type: :string, example: 'John Doe' },
              email: { type: :string, example: 'john.doe@example.com' },
              password: { type: :string, example: 'password' },
              created_at: { type: :string, format: 'date-time' },
              updated_at: { type: :string, format: 'date-time' }
            }
          },
          Order: {
            type: :object,
            properties: {
              id: { type: :integer, example: 1 },
              user_id: { type: :integer, example: 1 },
              total_amount: { type: :number, example: 1500.0 },
              created_at: { type: :string, format: 'date-time' },
              updated_at: { type: :string, format: 'date-time' }
            }
          },
          Cart: {
            type: :object,
            properties: {
              id: { type: :integer, example: 1 },
              user_id: { type: :integer, example: 1 },
              created_at: { type: :string, format: 'date-time' },
              updated_at: { type: :string, format: 'date-time' },
              cart_items: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    product_id: { type: :integer, example: 1 },
                    quantity: { type: :integer, example: 2 }
                  }
                }
              }
            }
          }
        }
      },
      security: [{
        bearerAuth: []
      }]
    }
  }

  config.swagger_format = :yaml
end
