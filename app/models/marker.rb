class Marker < ActiveRecord::Base
  belongs_to :point
  belongs_to :category
end
