class OpenWeatherService
  def self.forcast(lat, long)
    response = Faraday.get('https://api.openweathermap.org/data/2.5/onecall') do |f|
      f.params['appid'] = ENV['open_weather_key']
      f.params['lat'] = lat
      f.params['lon'] = long
      f.params['units'] = 'imperial'
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
