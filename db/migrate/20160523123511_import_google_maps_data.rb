require 'nokogiri'

class GoogleMapsData
  attr_reader :doc

  def initialize(file)
    @doc = File.open(file) { |f| Nokogiri::XML(f) }
  end

  def parse
    doc.css("kml > Document > Folder").map do |node|
      hash = {
        title: node.at_css("name").content.strip
      }

      hash[:points] = node.css("Placemark").map do |child|
        position = child.at_css("Point coordinates").content.split(',')
        {
          title: child.at_css("name").content.strip,
          latitude: position[1].to_f,
          longitude: position[0].to_f
        }
      end

      hash
    end
  end
end

class ImportGoogleMapsData < ActiveRecord::Migration
  def up
    file = Rails.root.join("db", "fixtures", "google_maps_data.xml")
    data = GoogleMapsData.new(file)

    data.parse.each do |node|
      category = Category.create!(title: node[:title])
      node[:points].each do |point|
        Point.create!(
          title: point[:title],
          latitude: point[:latitude],
          longitude: point[:longitude],
          categories: [category]
        )
      end
    end
  end

  def down
    Category.delete_all
    Point.delete_all
    Marker.delete_all
  end
end
