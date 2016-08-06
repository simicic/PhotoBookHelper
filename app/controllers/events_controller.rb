class EventsController < ApplicationController
  before_action :load_event, only: [:edit, :show, :update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def show
    @tags = Tag.all
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = 'Successfully saved!'
      redirect_to events_path
    else
      render :new
    end
  end

  def update
    Event.transaction do |event|
      @event.update_attributes(event_params)
      images_params.each do |image_file|
        @event.images.create(image_file: image_file)
      end
    end

    redirect_to event_path(@event)
  end

  private

  def load_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name)
  end

  def images_params
    params[:event][:images_attributes][:image_file]
  end
end
