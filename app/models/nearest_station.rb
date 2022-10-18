class NearestStation < ApplicationRecord
  belongs_to :property, inverse_of: :nearest_stations
  validates :route_name, presence: true
  validates :station_name, presence: true
  validates :time, presence: true
end
