class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def move_tagged_images
    system("rake move_tagged_images[#{params[:tag_id]},#{params[:event_id]}]")
    redirect_to :back
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = 'Successfully saved!'
      redirect_to tags_path
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:label)
  end
end
