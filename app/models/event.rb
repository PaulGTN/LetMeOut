class Event < ApplicationRecord
  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :users, foreign_key:'attendee_id'
  validates :start_date, presence: true 
  #validates :not_in_the_past
  validates :duration, presence: true, numericality: { greater_than: 0, only_integer: true}
  #validates :multiple_of_5
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true,  length: {in: 20..1000}
  validates :price, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 1000}
  validates :location, presence: true 

  def not_in_the_past
    if self.start_date - Time.now < 0
      self.errors.add(:start_date, "It cannont be in the past")
    end
  end

  def multiple_of_5
    if self.duration % 5 != 0
      self.errors.add(:duration, "The event must have a multiple of 5 for his duration")
    end
  end

end
