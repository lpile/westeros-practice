require "rails_helper"

RSpec.describe WesterosAsAServiceService do
  it "gets house ids" do
    service = WesterosAsAServiceService.new

    result = service.get_house_ids

    expect(result.first).to have_key(:id)
    expect(result.first).to have_key(:name)
  end

  it "gets house members" do
    service = WesterosAsAServiceService.new

    result = service.get_member_data(1)

    expect(result.first[:id]).to eq(1)
    expect(result.first[:name]).to eq('Rickard Stark')
  end
end
