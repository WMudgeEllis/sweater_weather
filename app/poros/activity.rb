class Activity
  attr_reader :title, :type, :participants, :price

  def initialize(data)
    @title = data[:activity]
    @type = data[:type]
    @participants = data[:participants]
    @price = data[:price]
  end
end
