class HouseSearchFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def members
    members = get_member_data(@house)
  end

  def member_count

  end

  def conn
    Faraday.new(url: 'http://westerosapi.herokuapp.com') do |faraday|
      faraday.params['api_key'] = ENV['WESTEROS_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_member_data(house_name)
    response = conn.get("/api/v1/house/#{house_name}")
    JSON.parse(response.body, symbolize_names: true)[:data]
  end
end
