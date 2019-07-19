class HouseSearchFacade
  attr_reader :house
  attr_accessor :id

  def initialize(house)
    @house = house
    @id = nil
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

  def westeros_as_service
    @_westeros_as_service ||= WesterosAsAServiceService.new
  end

  def member_data
    find_house_id.each do |index|
      @id = index[:id] if index[:name].downcase == @house.downcase
    end
    @_member_data ||= westeros_as_service.get_member_data(@id)
  end

  def find_house_id
    @_find_house_id ||= westeros_as_service.get_house_ids
  end
end
