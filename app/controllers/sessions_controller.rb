# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    jws = params.require(:assertion).to_s
    @connection = RapidConnection.find(params.require(:rapid_connection_id))
    @jwt = JSON::JWT.decode(jws, @connection.secret)
  rescue StandardError => e
    render json: "#{e.class}\n\n#{e.message}"
  end
end
