# frozen_string_literal: true

class RapidConnection < ApplicationRecord
  validates :nickname, presence: true

  has_secure_token :secret

  def connected?
    secret.present? && callback_url.present?
  end
end
