class Event < ApplicationRecord
  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :attendees, class_name: "User", through: :attendances
  validates :start_date, presence: true 
  validate :not_in_the_past
  validates :duration, presence: true, numericality: { greater_than: 0, only_integer: true}
  validate :multiple_of_5
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true,  length: {in: 20..1000}
  validates :price, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 1000}
  validates :location, presence: true 

  private 

  def not_in_the_past
    errors.add(:start_date, "Can't be in the past") unless start_date.present? && start_date > Date.today    
  end

  def multiple_of_5
    errors.add(:duration, "Must be a multiple of 5") unless self.duration.to_i % 5 == 0
  end

end
