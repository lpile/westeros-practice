class WesterosAsAServiceService
  def get_house_ids
    fetch_data("/api/v1/house")
  end

  def get_member_data(house_id)
    fetch_data("/api/v1/house/#{house_id}")
  end

  private

  def conn
    Faraday.new(url: 'https://westeros-as-a-service.herokuapp.com') do |faraday|
      faraday.headers['x_api_key'] = ENV['WESTEROS_SERVICE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_data(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
