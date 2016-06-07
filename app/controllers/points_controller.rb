class PointsController < ApplicationController
  def index
    @point = Point.new
    points
    categories

    respond_to do |f|
      f.html
      f.json { render json: @points }
    end
  end

  def edit
    point
    categories
  end

  def create
    @point = Point.new(point_params)
    @point.audio = params[:point][:title].parameterize
    points
    if @point.save
      redirect_to edit_point_path(@point), notice: %(Point created)
    else
      render :index
    end
  end

  def update
    if point.update(point_params)
      redirect_to edit_point_path(point), notice: %(Point "#{point}" updated)
    else
      render :edit
    end
  end

  def destroy
    point.destroy
    redirect_to root_path, alert: %(Point "#{point}" removed)
  end

  def search
    @search_results = Point.where("title ILIKE ?", "%#{params[:term]}%")
  end

  private

  def point_params
    params.require(:point).permit(
      :title,
      :latitude,
      :longitude,
      :audio,
      :description,
      category_ids: [],
      triggers_attributes: [:id, :latitude, :longitude, :_destroy]
    )
  end

  def categories
    @categories = Category.order(:position)
  end

  def point
    @point ||= Point.find(params[:id])
  end

  def points
    @points ||= Point.includes(:categories)
  end
end
