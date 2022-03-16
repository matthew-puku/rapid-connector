# frozen_string_literal: true

class RapidConnection < ApplicationRecord
  validates :nickname, presence: true

  has_secure_token :secret

  def connected?
    secret.present? && callback_url.present?
  end

  def direct_auth_url
    URI.parse(callback_url).tap do |uri|
      uri.query = { entityID: preferred_entity_id }.to_query
    end.to_s
  end
end
