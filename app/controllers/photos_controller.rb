class PhotosController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @photo.save
      # TODO some flash
      redirect_to photos_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
