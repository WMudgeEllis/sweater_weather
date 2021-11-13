class Background
  attr_reader :image_url, :credit

  def initialize(data)
    @image_url = data[:urls][:full]
    @credit = {
      photographer: data[:user][:name],
      photographer_portfolio: data[:user][:portfolio_url]
    }
  end
end
