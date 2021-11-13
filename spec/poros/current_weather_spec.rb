require "rails_helper"

RSpec.describe CurrentWeather do


  it 'exists and has attributes' do
    data = {
        "dt": 1636820278,
        "sunrise": 1636810962,
        "sunset": 1636847163,
        "temp": 57.6,
        "feels_like": 54.61,
        "pressure": 1016,
        "humidity": 33,
        "dew_point": 29.12,
        "uvi": 0.7,
        "clouds": 100,
        "visibility": 10000,
        "wind_speed": 6.2,
        "wind_deg": 259,
        "wind_gust": 13.69,
        "weather": [
            {
                "id": 804,
                "main": "Clouds",
                "description": "overcast clouds",
                "icon": "04d"
            }
        ]
    }

    weather = CurrentWeather.new(data)

    expect(weather.datetime).to eq('2021-11-13 09:17:58 -0700')
    expect(weather.sunrise).to eq('2021-11-13 06:42:42 -0700')
    expect(weather.sunset).to eq('2021-11-13 16:46:03 -0700')
    expect(weather.temperature).to eq(57.6)
    expect(weather.feels_like).to eq(54.61)
    expect(weather.humidity).to eq(33)
    expect(weather.uvi).to eq(0.7)
    expect(weather.visibility).to eq(10000)
    expect(weather.conditions).to eq("overcast clouds")
    expect(weather.icon).to eq("04d")
  end
end
