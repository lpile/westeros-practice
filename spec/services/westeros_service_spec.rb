require "rails_helper"

RSpec.describe WesterosService do
  it "gets results" do
    service = WesterosService.new

    result = service.get_results('stark')

    expect(result).to have_key(:data)
    expect(result[:data].first).to have_key(:id)
    expect(result[:data].first).to have_key(:type)
    expect(result[:data].first).to have_key(:attributes)
    expect(result[:data].first[:attributes).to have_key(:name)
    expect(result[:data].first[:attributes).to have_key(:members)
  end
end
