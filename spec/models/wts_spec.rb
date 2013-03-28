require 'spec_helper'

describe Wtb do
  it "should have unique permalink" do
    first = create(:wtb,item: "Permalink Test")
    second = create(:wtb,item: "Permalink Test")
    first.permalink.should_not be second.permalink
  end
end
