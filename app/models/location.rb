class Location < ApplicationRecord
  has_many :patients, dependent: :destroy

  validates :name, length: {maximum: 80}, presence: true
  validates :code, length: {maximum: 10}
end
