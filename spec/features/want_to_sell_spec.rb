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
    click_on "Next"
    page.should have_content("Images for #{Wts.last.item}")
    current_path.should == "/wts/#{Wts.last.slug}/wts_steps/images"
    path = File.join("#{::Rails.root}/app/assets/images", "rails.png")
    attach_file("Images", path)
    #page.should have_content("You can upload multiple images.")
    click_on "Finish"

    page.should have_content("Images for your WTS is updated")

    current_path.should == "/wts/#{Wts.last.permalink}"
  end

  scenario "Search for Wts from home page" do
    create(:wts, item: "Logitech Keyboard")
    visit "/"
    #select "WTS", from: "search_for"
    fill_in "search", with: "Keyboard"
    click_on "Search"
    page.should have_content("Results for: Keyboard")
    page.should have_content("Logitech")
  end

  scenario "User visits wts that it owns" do
    w = create(:wts, item: "Keyboard", user: current_test_user, links: "http://google.com http://wikipedia.com")
    visit "/wts/#{w.slug}"
    page.should have_content("Keyboard")
    page.should have_content("Edit")
    page.should_not have_content("Contact Seller")
    page.should have_link("http://google.com", href: "http://google.com")
    page.should have_link("http://wikipedia.com", href: "http://wikipedia.com")
  end

  scenario "User visits someone else's wts" do
    w = create(:wts, item: "Mouse", links: "http://google.com http://wikipedia.com")
    visit "/wts/#{w.slug}"
    page.should have_content("Mouse")
    page.should have_content("Contact Seller")
    page.should_not have_content("Edit")
    page.should have_link("http://google.com", href: "http://google.com")
    page.should have_link("http://wikipedia.com", href: "http://wikipedia.com")
  end
end
