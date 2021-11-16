class BackgroundSerializer
  def self.background(background, location)
    {
      data: {
        type: 'image',
        id: nil,
        attributes: {
          location: location,
          image_url: background.image_url,
          credit: {
            source: 'unsplash.com',
            photographer: background.credit[:photographer],
            photographer_portfolio: background.credit[:photographer_portfolio]
          }
        }
      }
    }
  end
end
