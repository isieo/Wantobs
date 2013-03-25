require 'spec_helper'

feature "[Want to sell]" do
  background do
    user_login
  end

  scenario "Creating a new sell request" do
    visit "/wts/new"
    fill_in "Item", with: "Playstation"
    fill_in "Price", with: "RM 400.00"
    fill_in "Quantity Available", with: "5"
    fill_in "Additional Info", with: "I need this as my old one broked"
    fill_in "Links", with: "http://forum.lowyat.net/topic/xxx1x http://collect.my"
    check "Used"
    check "Seller's warranty"
    select "Personal Message", from: "Contact Method"
    select "Cash on delivery", from: "Payment Method"
    select "Pick up", from: "Prefered Collection Method"
    click_on "Create WTS"

    page.should have_content("Your WTS is created")

    current_path.should == "/wts/#{Wts.last.permalink}"
  end

end
