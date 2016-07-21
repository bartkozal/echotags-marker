class DescriptionsController < ApplicationController
  def index
    @descriptions = Point.all.map(&:description)
  end
end
