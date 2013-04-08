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
    click_on "Next"
    page.should have_content("Images for #{Wtb.last.item}")
    current_path.should == "/wtb/#{Wtb.last.slug}/wtb_steps/images"
    path = File.join("#{::Rails.root}/app/assets/images", "rails.png")
    attach_file("Images", path)
    page.should have_content("You can upload multiple images.")
    click_on "Finish"

    page.should have_content("Images for your WTB is updated")

    current_path.should == "/wtb/#{Wtb.last.slug}"

    page.should have_content("Playstation controller")
  end


  scenario "Editing an existing buy request" do
    w = create(:wtb, item: "Keyboard", user: current_test_user, links: "http://google.com http://wikipedia.com")
    visit "/wtb/#{w.slug}/edit"
    current_path.should == "/wtb/#{w.slug}/edit"
    fill_in "Item", with: "Logitech Keyboard"
    fill_in "Budget", with: "RM 300.00"
    fill_in "Quantity", with: "5"
    fill_in "Additional Info", with: "I need this as my old one broked"
    fill_in "Links", with: "http://forum.lowyat.net/topic/xxx1x http://collect.my"
    check "Brand new"
    check "Factory warranty"
    select "Personal Message", from: "Contact Method"
    select "Cash on delivery", from: "Payment Method"
    select "Pick up", from: "Prefered Collection Method"
    click_on "Next"
    cw = Wtb.find w.id
    cw.item.should == "Logitech Keyboard"
    page.should have_content("Images for #{Wtb.last.item}")
    current_path.should == "/wtb/#{Wtb.last.slug}/wtb_steps/images"
    path = File.join("#{::Rails.root}/app/assets/images", "rails.png")
    attach_file("Images", path)
    page.should have_content("You can upload multiple images.")
    click_on "Finish"

    page.should have_content("Images for your WTB is updated")

    current_path.should == "/wtb/#{Wtb.last.slug}"

    page.should have_content("Logitech Keyboard")
  end

  scenario "User must be signed in to create a new wtb" do
    page.driver.submit :delete, destroy_user_session_path, {} #logout
    visit "/wtb/new"
    current_path.should_not == "/wtb/new"
  end

  scenario "User must be signed in and own the wtb to edit it" do
    page.driver.submit :delete, destroy_user_session_path, {} #logout
    w = create(:wtb, item: "Keyboard", links: "http://google.com http://wikipedia.com")
    visit "/wtb/#{w.slug}/edit"
    current_path.should_not == "/wtb/#{w.slug}/edit"
  end

  scenario "Listing all requests" do
    create(:wtb, item: "10 Megapixel camera")
    visit "/wtb"
    page.should have_content("10 Megapixel camera")
  end

  scenario "User visits wtb that it owns" do
    w = create(:wtb, item: "Keyboard", user: current_test_user, links: "http://google.com http://wikipedia.com")
    visit "/wtb/#{w.slug}"
    page.should have_content("Keyboard")
    page.should have_content("Edit")
    page.should_not have_content("Contact Buyer")
    page.should have_link("http://google.com", href: "http://google.com")
    page.should have_link("http://wikipedia.com", href: "http://wikipedia.com")
  end

  scenario "User visits someone else's wtb" do
    w = create(:wtb, item: "Mouse", links: "http://google.com http://wikipedia.com")
    visit "/wtb/#{w.slug}"
    page.should have_content("Mouse")
    page.should_not have_content("Edit")
    page.should have_content("Contact Buyer")
    page.should have_link("http://google.com", href: "http://google.com")
    page.should have_link("http://wikipedia.com", href: "http://wikipedia.com")
  end

  scenario "Search for Wtb from home page" do
    create(:wtb, item: "Logitech Keyboard", user: current_test_user, links: "http://google.com http://wikipedia.com")
    visit "/"
    select "WTB", from: "Search for"
    fill_in "keyword", with: "Keyboard"
    click_on "Search"
    page.should have_content("Results for: Keyboard")
    page.should have_content("Logitech")
  end


end
