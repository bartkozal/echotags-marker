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
    points
    if @point.save
      redirect_to root_path
    else
      render :index
    end
  end

  def update
    if point.update(point_params)
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
    point.destroy
    redirect_to reports_path
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
      :recording_path,
      :description,
      category_ids: [],
      triggers_attributes: [:id, :latitude, :longitude, :_destroy]
    )
  end

  def categories
    @categories = Category.all
  end

  def point
    @point ||= Point.find(params[:id])
  end

  def points
    @points ||= Point.includes(:categories)
  end
end
