class EventsController < ApplicationController


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
    @user = current_user
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'Événement mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    if @event.destroy
      flash[:success] = "Le gossip a été supprimé avec succès."
      redirect_to root_path, notice:
    else
      flash[:error] = "echec"
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :title, :description, :location, :price, :start_date, :duration)
  end
end
