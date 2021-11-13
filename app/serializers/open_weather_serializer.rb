class OpenWeatherSerializer

  def self.forcast(coords)
    #refactor to a facade?
    weather_info = OpenWeatherService.forcast(coords[:lat], coords[:long])
    current = CurrentWeather.new(weather_info[:current])
    daily = weather_info[:daily][0..4].map { |day_info| DailyWeather.new(day_info) }
    hourly = weather_info[:hourly][0..7].map { |hour_info| HourlyWeather.new(hour_info) }
    {
      data: {
        id: nil,
        type: 'forecast',
        attributes: {
          current_weather: {
            datetime: current.datetime,
            sunrise: current.sunrise,
            sunset: current.sunset,
            temperature: current.temperature,
            feels_like: current.feels_like,
            humidity: current.humidity,
            uvi: current.uvi,
            visibility: current.visibility,
            conditions: current.conditions,
            icon: current.icon
          },
          daily_weather:  daily.map do |day|
            {
              date: day.date,
              sunrise: day.sunrise,
              sunset: day.sunset,
              max_temp: day.max_temp,
              min_temp: day.min_temp,
              conditions: day.conditions,
              icon: day.icon
            }
          end,
          hourly_weather: hourly.map do |hour|
            {
              time: hour.time,
              temperature: hour.temperature,
              conditions: hour.conditions,
              icon: hour.icon
            }
          end
        }
      }
    }

  end

end
