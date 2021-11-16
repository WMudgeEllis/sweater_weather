class WeatherFacade

  def self.weather_at_eta(coords, travel_time)
    forcast = OpenWeatherService.forcast(coords[:lat], coords[:long])
    return {} if travel_time.nil?
    hour = forcast[:hourly][travel_time.to_i]
    { temperature: hour[:temp], conditions: hour[:weather][0][:description] }
  end
end
