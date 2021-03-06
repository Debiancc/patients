class Patient < ApplicationRecord
  acts_as_paranoid
  include VirtualAttributes

  enum gender: %w(no_available male female)
  enum status: %w(initial referred treatment closed)

  scope :on_treatment, -> { where(status: 'treatment') }

  belongs_to :location

  validates :first_name, :last_name, length: {maximum: 30}, presence: true
  validates :middle_name, length: {maximum: 10}
  validates :status, :location, presence: true
end
