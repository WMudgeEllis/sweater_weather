class ActivityService

  def self.relaxation
    response = Faraday.get('http://www.boredapi.com/api/activity', {type: 'relaxation'})
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.recreational
    response = Faraday.get('http://www.boredapi.com/api/activity', {type: 'recreational'})
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.busywork
    response = Faraday.get('http://www.boredapi.com/api/activity', {type: 'busywork'})
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cooking
    response = Faraday.get('http://www.boredapi.com/api/activity', {type: 'cooking'})
    JSON.parse(response.body, symbolize_names: true)
  end
end
