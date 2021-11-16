class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:dt]).to_time.strftime('%H:%M')
    @temperature = data[:temp]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
