class EventsController < ApplicationController
  skip_before_action :require_authentication, only: [:index]

  def new
    @event = Event.new 
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.create(event_params)
    @event.user = current_user
    if @event.save
      flash[:success] = "Event enregistré avec succès !"
      redirect_to @event
    else
      p @event.errors.full_messages
    end
  end
  def show
    @event = Event.find_by(id: params[:id])
  end

  private 

  def event_params
    params.require(:event).permit(:user_id, :title, :description, :location, :price, :start_date, :duration)
  end

end
