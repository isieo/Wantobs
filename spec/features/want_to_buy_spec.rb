require 'spec_helper'

feature "[Want to buy]" do
  background do
    user_login
  end

  scenario "Creating a new buy request" do
    visit "/wtb/new"
    fill_in "Item", with: "Playstation controller"
    fill_in "Budget", with: "RM 300.00"
    fill_in "Quantity", with: "5"
    fill_in "Additional Info", with: "I need this as my old one broked"
    fill_in "Links", with: "http://forum.lowyat.net/topic/xxx1x http://collect.my"
    check "Brand new"
    check "Factory warranty"
    select "Personal Message", from: "Contact Method"
    select "Cash on delivery", from: "Payment Method"
    select "Pick up", from: "Prefered Collection Method"
    click_on "Create WTB"

    page.should have_content("Your WTB is created")

    current_path.should == "/wtb/#{Wtb.last.slug}"

    page.should have_content("Playstation controller")
  end

  scenario "Listing all requests" do
    create(:wtb, item: "10 Megapixel camera")
    visit "/wtb"
    page.should have_content("10 Megapixel camera")

  end
end
