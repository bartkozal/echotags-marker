class DescriptionsController < ApplicationController
  def index
    @points = Point.all
  end
end
