# frozen_string_literal: true

class RapidConnection < ApplicationRecord
  validates :nickname, presence: true
end
