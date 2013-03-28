require 'spec_helper'

describe Wtb do
  it "should have unique permalink" do
    first = create(:wtb,item: "Permalink Test")
    second = create(:wtb,item: "Permalink Test")
    first.slug.should_not be second.slug
  end
end
