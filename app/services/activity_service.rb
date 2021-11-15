class ActivityService

  def self.relaxation
    base('relaxation')
  end

  def self.recreational
    base('recreational')
  end

  def self.busywork
    base('busywork')
  end

  def self.cooking
    base('cooking')
  end

  def self.base(type)
    response = Faraday.get('http://www.boredapi.com/api/activity', {type: type})
    JSON.parse(response.body, symbolize_names: true)
  end
end
