class Session < ApplicationRecord
  validates :username, presence: true
  validates_uniqueness_of :username, scope: :token
  validates :token, presence: true, uniqueness: true
end
