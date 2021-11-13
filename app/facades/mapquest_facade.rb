class MapquestFacade

  def self.lat_long(city_state)
    location_data = MapquestService.location_info(city_state)
    {
      lat: location_data[:results][0][:locations][0][:latLng][:lat],
      long: location_data[:results][0][:locations][0][:latLng][:lng]
    }
  end
end
