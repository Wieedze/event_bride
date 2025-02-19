class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @event = Event.find_by(id: params[:event_id])
    @attendance = Attendance.new(attendances_params)
    @attendance.user = current_user
    if @attendance.save
      p "you are goin to partyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
      flash[:notice] = "Reservation créé !"
    else
      p @attendance.errors.full_messages
    end
  end

  def index
    @event = Event.find_by(id: params[:event_id])
    @attendees = @event.attendances.includes(:user).map(&:user)
  end

  def destroy
  end

  def update
  end

  private

  def attendances_params
    params.require(:attendance).permit(:user_id, :event_id)
  end
end
