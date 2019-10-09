class Place < ApplicationRecord
  validates :name, :address, presence: true
end
