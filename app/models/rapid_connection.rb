class RapidConnection < ApplicationRecord
  validates :nickname, presence: true
end
