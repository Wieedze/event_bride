class EventsController < ApplicationController
  skip_before_action :require_authentication, only: [:index]

  def new
    @event = Event.new 
  end

  def index
    @events = Event.all
  end

  def create
    @event.new(event_params)
    @event.user = current_user
    if @event.save
      flash[:success] = "Event enregistré avec succès !"
      redirect_to @event
    else
      render :event, status: :unprocessable_entity
    end
  end

end
