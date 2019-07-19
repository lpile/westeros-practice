require 'rails_helper'

feature 'User can search for westeros house members' do
  scenario 'by valid house name' do
    # As a user
    # When I visit "/"
    visit '/'

    # And I select "Greyjoy" from the dropdown
    # And I click on "Get Members"
    select "Greyjoy", from: :house
    click_on "Get Members"

    # Then my path should be "/search" with "house=greyjoy" in the parameters
    expect(current_path).to eq("/search")
    expect(current_url).to include("house=greyjoy")

    # And I should see a message "7 Members"
    expect(page).to have_content("7 Members")
    # And I should see a name and id for each member.
    expect(page).to have_all_of_selectors(".member_list-name", ".member_list-id")

    # And I should see a list of the 7 members of House Greyjoy
    expect(page).to have_css(".member_list", count: 7)
  end
end
