class MapquestService

  def self.location_info(city_state)
    Faraday.get('http://www.mapquestapi.com/geocoding/v1/address') do |f|
      f.params['key'] = ENV['mapquest_key']
      f.params['location'] = city_state
    end

  end

end
