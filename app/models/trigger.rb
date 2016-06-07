class Trigger < ActiveRecord::Base
  belongs_to :point

  validates_presence_of :latitude, :longitude
end
