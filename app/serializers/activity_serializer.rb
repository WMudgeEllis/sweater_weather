class ActivitySerializer

  def self.render_activities(activities, forcast, location)
    {
      data: {
        id: nil,
        type: 'activities',
        attributes: {
          destination: location,
          forcast: {              
            summary: forcast[:attributes][:current_weather][:conditions],
            #format to add f
            temperature: forcast[:attributes][:current_weather][:temperature]
          }
        },
        activities: activities.map  do |activity|
          {
            title: activity.title,
            type: activity.type,
            participants: activity.participants,
            price: activity.price
          }
        end
      }
    }
  end
end
