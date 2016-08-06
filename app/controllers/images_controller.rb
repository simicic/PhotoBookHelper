class ImagesController < ApplicationController

  def show
    @image = load_image
    @event = load_event
    @tags = Tag.all
  end

  def update
    @image = load_image
    @image.update_attributes(images_params)
    @tags = Tag.all
    @event = load_event
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def load_image
    Image.find(params[:id])
  end

  def images_params
    params.require(:image).permit(:tag_id)
  end
end
