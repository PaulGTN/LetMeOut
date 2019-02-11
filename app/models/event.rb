class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :user
  validates :start_date, presence: true #can't create or modify event in the past
  #validates_datetime :start_date, :after => lambda {Time.now}, :after_message => "Can't be in the past"
  validates :duration, presence: true, numericality: {only_integer: true}#, if: :multiple_of_5: true #min must be multiple of 5 and strictly positive
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true,  length: {in: 20..1000}
  validates :price, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 1000}
  validates :location, presence: true 

  def multiple_of_5
    if duration % 5 == 0
      return true
    else
      return false
    end
  end

end
