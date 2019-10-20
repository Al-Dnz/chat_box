class Session < ApplicationRecord
  validates :username, uniqueness: true
end
