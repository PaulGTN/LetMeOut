class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  has_many :events
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
end
