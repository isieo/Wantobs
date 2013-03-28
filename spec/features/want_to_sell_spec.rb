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
    pending "Read The Following rails cast to do this correctly \n \
             http://railscasts.com/episodes/346-wizard-forms-with-wicked \n \
             http://railscasts.com/episodes/253-carrierwave-file-uploads \n \
             http://railscasts.com/episodes/381-jquery-file-upload \n \
             then remove this pending line from this test"
    click_on "Next"
    page.should have_content("Images for #{Wts.last.name}")
    current_path.should == "/wts_steps/#{Wts.last.slug}/image"
    path = File.join("#{::Rails.root}/app/assets/images", "rails.png")
    attach_file("Images", path)
    page.should have_content("You can upload multiple images.")
    click_on "Finish"

    page.should have_content("Your WTS is created")

    current_path.should == "/wts/#{Wts.last.permalink}"
  end

  scenario "Search for Wts from home page" do
    create(:wts, item: "Logitech Keyboard")
    visit "/"
    select "WTS", from: "Search for"
    fill_in "keyword", "Keyboard"
    click_on "Search"
    page.should have_content("Results for: Keyboard")
    page.should have_content("Logitech")
  end

end
