class ListingsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    if @listing.soft_delete
      # TODO: flash success
      redirect_to listings_url
    end
  end
end
