# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorize_request

  attr_reader :current_user

  private

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = JsonWebToken.decode(token)
      @current_user = User.find(decoded[:user_id]) if decoded.present? && decoded[:user_id].present?
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end
end
