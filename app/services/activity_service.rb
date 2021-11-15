class ActivityService

  def self.relaxation
    response = Faraday.get('http://www.boredapi.com/api/activity', {type: 'relaxation'})
    JSON.parse(response.body, symbolize_names: true)
  end
end
