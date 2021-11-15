class ActivityFacade



  def self.activities(forcast)
    temp = forcast[:attributes][:current_weather][:temperature]
    arr = []

    if temp >= 60
      arr << Activity.new(ActivityService.recreational)
    elsif temp >= 50
      arr << Activity.new(ActivityService.busywork)
    elsif temp < 50
      arr << Activity.new(ActivityService.cooking)
    end

    relaxation = Activity.new(ActivityService.relaxation)
    arr << relaxation
    arr
  end
end
