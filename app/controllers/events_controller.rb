class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(tag_params)

    if @event.save
      flash[:notice] = 'Successfully saved!'
      redirect_to events_path
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:event).permit(:name)
  end
end
