require 'spec_helper'
require './app/models/house'

describe House do
  let(:attributes) {
    {
      "id": 1,
      "name": "Rickard Stark",
      "house_id": 1,
      "created_at": "2019-05-15T03:54:20.930Z",
      "updated_at": "2019-05-15T03:54:20.930Z"
    }
  }

  subject { House.new(attributes) }

  it "exists" do
    expect(subject).to be_a House
    expect(subject.name).to eq "Rickard Stark"
    expect(subject.id).to eq 1 
  end
end
