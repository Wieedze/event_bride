class Attendance < ApplicationRecord
  after_create :attendance_participation_send 

  belongs_to :user
  belongs_to :event


  def attendance_participation_send
    UserMailer.attendance_participation_email(self).deliver_now
  end
end
