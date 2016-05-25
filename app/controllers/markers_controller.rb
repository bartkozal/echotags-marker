class MarkersController < ApplicationController
  def index
    @markers = Marker.all

    respond_to do |f|
      f.json { render json: @markers }
    end
  end
end
