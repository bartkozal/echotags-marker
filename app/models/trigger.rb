class Trigger < ActiveRecord::Base
  belongs_to :point

  validates_presence_of :latitude, :longitude

  def as_json(*)
    {latitude: latitude, longitude: longitude}
  end
end
