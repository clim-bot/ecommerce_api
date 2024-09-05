# frozen_string_literal: true

class HealthController < ApplicationController
  # Skip authentication for the health check
  skip_before_action :authorize_request, only: [:check]

  def check
    render json: { status: 'OK', message: 'API is up and running!' }, status: :ok
  end
end
