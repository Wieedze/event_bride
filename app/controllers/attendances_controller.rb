class AttendancesController < ApplicationController

  def new 
    @attendance = Attendance.new
  end

  def create 
    @attendance = Attendance.new(attendances_params)
    @attendance.user = current_user
    if @attendance.save 
      p 'you are goin to partyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
      flash[:notice] = "Reservation créé !"
    else 
      p @attendance.errors.full_messages
    end
  end

  def index
    
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
