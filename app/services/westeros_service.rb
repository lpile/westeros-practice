class WesterosService
  def get_member_data(house_name)
    fetch_data("/api/v1/house/#{house_name}")
  end

  private

  def conn
    Faraday.new(url: 'http://westerosapi.herokuapp.com') do |faraday|
      faraday.params['api_key'] = ENV['WESTEROS_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_data(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:data].first[:attributes][:members]
  end
end
