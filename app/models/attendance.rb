class Attendance < ApplicationRecord
  after_create :attendance_confirm

  belongs_to :attendee, class_name: "User"
  belongs_to :event

  def attendance_confirm
    AttendanceMailer.event_attendance_confirmation(self).deliver_now
  end

end