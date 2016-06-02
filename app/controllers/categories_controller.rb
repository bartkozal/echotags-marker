class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:position)

    respond_to do |f|
      f.html
      f.json { render json: @categories }
    end
  end

  def show
    category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: %(Category "#{@category}" created)
    else
      render :new
    end
  end

  def edit
    category
  end

  def update
    if category.update(category_params)
      redirect_to categories_path, notice: %(Category "#{category}" updated)
    else
      render :edit
    end
  end

  def destroy
    category.destroy
    redirect_to categories_path, alert: %(Category "#{category}" removed)
  end

  def sort
    params.permit(:id, :position)
    category = Category.find(params[:id])
    category.insert_at(params[:position].to_i)
    head :ok
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def category
    @category ||= Category.find(params[:id])
  end
end
