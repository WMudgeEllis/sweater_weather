class UnsplashService

  def self.search(keyword)
    response = Faraday.get('https://api.unsplash.com/search/photos') do |f|
      f.params['client_id'] = ENV['unsplace_id']
      f.params['query'] = keyword
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
