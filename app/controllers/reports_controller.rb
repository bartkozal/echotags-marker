class ReportsController < ApplicationController
  def index
    @duplicates = Point.includes(:categories).where(title: Point.duplicates)
    @without_description = Point.includes(:categories).where(description: nil)
  end
end
