# frozen_string_literal: true

require 'jwt'

class JsonWebToken
  # Set the expiration time (e.g., 24 hours)
  EXPIRATION_TIME = 24.hours.from_now.to_i

  # Secret key used to sign the JWT (typically stored in environment variables for security)
  SECRET_KEY = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base

  # Encode the payload with the secret key
  def self.encode(payload, exp = EXPIRATION_TIME)
    payload[:exp] = exp # Add expiration time to the payload
    JWT.encode(payload, SECRET_KEY)
  end

  # Decode the token and handle expired tokens or invalid signatures
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError => e
    # Handle exceptions for expired or invalid tokens
    raise "Invalid token: #{e.message}"
  end
end
