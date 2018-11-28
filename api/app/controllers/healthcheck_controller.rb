# frozen_string_literal: true

class HealthcheckController < ApplicationController
  def show
    render json: { ok: true, timestamp: Time.now }
  end
end
