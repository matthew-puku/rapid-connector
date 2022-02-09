# frozen_string_literal: true

json.extract! rapid_connection, :id, :nickname, :secret, :callback_url, :created_at, :updated_at
json.url rapid_connection_url(rapid_connection, format: :json)
