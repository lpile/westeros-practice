class HouseSearchFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def members
    member_data.map do |member_data|
      House.new(member_data)
    end
  end

  def member_count
    members.count
  end

  private

  def westeros_service
    @_westeros_servide = WesterosService.new
  end

  def member_data
    @_member_data ||= westeros_service.get_member_data(@house)
  end
end
