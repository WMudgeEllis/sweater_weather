require "rails_helper"

RSpec.describe ActivityFacade do

  it 'can return activity poros', :vcr do
    forcast ={
      :id=>nil,
      :type=>"forecast",
      :attributes=>
        {:current_weather=>
          {:datetime=>'2021-11-15 09:28:56 -0700',
           :sunrise=>'2021-11-15 05:40:37 -0700',
           :sunset=>'2021-11-15 15:29:59 -0700',
           :temperature=>33.33,
           :feels_like=>30.83,
           :humidity=>62,
           :uvi=>0.82,
           :visibility=>10000,
           :conditions=>"overcast clouds",
           :icon=>"04d"},
         }
     }
    activities = ActivityFacade.activities(forcast)

    expect(activities).to be_a(Array)
    expect(activities.length).to eq(2)
    expect(activities.first).to be_a(Activity)
  end

  it 'returns recreational when temp > 60', :vcr do
    forcast ={
      :id=>nil,
      :type=>"forecast",
      :attributes=>
        {:current_weather=>
          {:datetime=>'2021-11-15 09:28:56 -0700',
           :sunrise=>'2021-11-15 05:40:37 -0700',
           :sunset=>'2021-11-15 15:29:59 -0700',
           :temperature=>63.33,
           :feels_like=>30.83,
           :humidity=>62,
           :uvi=>0.82,
           :visibility=>10000,
           :conditions=>"overcast clouds",
           :icon=>"04d"},
         }
     }

    activity = ActivityFacade.activities(forcast).first

    expect(activity.type).to eq('recreational')
  end

  it 'returns busywork when temp is between 60 and 50', :vcr do
    forcast ={
      :id=>nil,
      :type=>"forecast",
      :attributes=>
        {:current_weather=>
          {:datetime=>'2021-11-15 09:28:56 -0700',
           :sunrise=>'2021-11-15 05:40:37 -0700',
           :sunset=>'2021-11-15 15:29:59 -0700',
           :temperature=>53.33,
           :feels_like=>30.83,
           :humidity=>62,
           :uvi=>0.82,
           :visibility=>10000,
           :conditions=>"overcast clouds",
           :icon=>"04d"},
         }
     }

    activity = ActivityFacade.activities(forcast).first

    expect(activity.type).to eq('busywork')
  end

  it 'returns cooking when temp is between 60 and 50', :vcr do
    forcast ={
      :id=>nil,
      :type=>"forecast",
      :attributes=>
        {:current_weather=>
          {:datetime=>'2021-11-15 09:28:56 -0700',
           :sunrise=>'2021-11-15 05:40:37 -0700',
           :sunset=>'2021-11-15 15:29:59 -0700',
           :temperature=>43.33,
           :feels_like=>30.83,
           :humidity=>62,
           :uvi=>0.82,
           :visibility=>10000,
           :conditions=>"overcast clouds",
           :icon=>"04d"},
         }
     }

    activity = ActivityFacade.activities(forcast).first

    expect(activity.type).to eq('cooking')
  end
end
