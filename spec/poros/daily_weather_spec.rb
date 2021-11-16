require 'rails_helper'

RSpec.describe DailyWeather do
  it 'exists and has attributes' do
    data = {
      "dt": 1_636_826_400,
      "sunrise": 1_636_810_962,
      "sunset": 1_636_847_163,
      "moonrise": 1_636_838_880,
      "moonset": 1_636_790_160,
      "moon_phase": 0.33,
      "temp": {
        "day": 60.84,
        "min": 46.99,
        "max": 64.63,
        "night": 51.31,
        "eve": 59.11,
        "morn": 47.57
      },
      "feels_like": {
        "day": 57.85,
        "night": 47.75,
        "eve": 55.76,
        "morn": 44.98
      },
      "pressure": 1017,
      "humidity": 26,
      "dew_point": 26.49,
      "wind_speed": 8.21,
      "wind_deg": 299,
      "wind_gust": 27.89,
      "weather": [
        {
          "id": 804,
          "main": 'Clouds',
          "description": 'overcast clouds',
          "icon": '04d'
        }
      ],
      "clouds": 100,
      "pop": 0,
      "uvi": 2.39
    }

    weather = DailyWeather.new(data)

    expect(weather.date).to eq('2021-11-13')
    expect(weather.sunrise).to eq('2021-11-13 06:42:42 -0700')
    expect(weather.sunset).to eq('2021-11-13 16:46:03 -0700')
    expect(weather.max_temp).to eq(64.63)
    expect(weather.min_temp).to eq(46.99)
    expect(weather.conditions).to eq('overcast clouds')
    expect(weather.icon).to eq('04d')
  end
end
