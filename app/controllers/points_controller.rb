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
      redirect_to edit_point_path(point)
    else
      render :edit
    end
  end

  def destroy
    if point.categories.count > 1
      category = params[:category]
      point.categories.delete(category)
      redirect_to category_path(category)
    else
      point.destroy
      redirect_to categories_path
    end
  end

  private

  def point_params
    params.require(:point).permit(:title, :latitude, :longitude, :recording_path, :description, category_ids: [])
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
