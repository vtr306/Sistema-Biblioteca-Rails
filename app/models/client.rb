class Client < ApplicationRecord
  has_many :reservations
  validates :name, presence: true, uniqueness: true
end
