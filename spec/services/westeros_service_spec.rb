require "rails_helper"

RSpec.describe WesterosService do
  it "gets results" do
    service = WesterosService.new

    result = service.get_member_data('stark')

    expect(result.first).to have_key(:name)
    expect(result.first).to have_key(:id)
    expect(result.first).to have_key(:house_id)
  end
end
