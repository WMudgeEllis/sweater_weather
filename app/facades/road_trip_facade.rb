class RoadTripFacade
  def self.get_road_trip(start, destination)
    destination_coords = MapquestFacade.lat_long(destination)
    travel_time = MapquestFacade.route_time(start, destination)
    data = {
      start_city: start,
      end_city: destination,
      travel_time: travel_time,
      weather_at_eta: WeatherFacade.weather_at_eta(destination_coords, travel_time)
    }
    RoadTrip.new(data)
  end
end
