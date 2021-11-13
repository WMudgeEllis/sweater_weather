require "rails_helper"


RSpec.describe HourlyWeather do


  it 'exists and has attributes' do
    data = {
        "dt": 1636822800,
        "temp": 61,
        "feels_like": 58.06,
        "pressure": 1017,
        "humidity": 27,
        "dew_point": 27.41,
        "uvi": 1.38,
        "clouds": 100,
        "visibility": 10000,
        "wind_speed": 4.5,
        "wind_deg": 259,
        "wind_gust": 8.55,
        "weather": [
            {
                "id": 804,
                "main": "Clouds",
                "description": "overcast clouds",
                "icon": "04d"
            }
        ],
        "pop": 0
    }
    weather = HourlyWeather.new(data)

    expect(weather.time).to eq('10:00')
    expect(weather.temperature).to eq(61)
    expect(weather.conditions).to eq("overcast clouds")
    expect(weather.icon).to eq("04d")
  end
end
