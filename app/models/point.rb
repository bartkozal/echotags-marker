class Point < ActiveRecord::Base
  has_many :categories, through: :markers
  has_many :markers, dependent: :destroy
  has_many :triggers

  validates_presence_of :title, :categories, :latitude, :longitude

  accepts_nested_attributes_for :triggers, reject_if: :all_blank, allow_destroy: true

  default_scope { order(:title) }

  def self.duplicates
    Point.group(:title).count.select { |_, count| count > 1 }.keys
  end

  def self.words_count
    text = Point.all.map(&:description).join
    WordsCounted.count(text).token_count
  end

  def inline_categories
    categories.join(", ")
  end

  def to_s
    title
  end

  def color
    categories.first.color
  end

  def as_json(*)
    json = {title: title, latitude: latitude, longitude: longitude, audio: audio, color: color}
    json[:triggers] = if triggers.present?
      triggers.map.with_index(1) do |trigger, index|
        {id: "#{audio}-#{index}", latitude: trigger.latitude, longitude: trigger.longitude}
      end
    else
      [{id: "#{audio}-1", latitude: latitude, longitude: longitude}]
    end
    json
  end
end
