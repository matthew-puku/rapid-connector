# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    jws = params.require(:assertion).to_s
    secret = RapidConnection.find(params.require(:rapid_connection_id)).secret
    jwt = JSON::JWT.decode(jws, secret)

    render json: jwt
  rescue StandardError => e
    render json: "#{e.class}\n\n#{e.message}"
  end
end
