FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "foo#{n}" }
    password "foobar"
    email { "#{username}@example.com" }

  end

  factory :wtb do
    item "Foo"
    budget "RM500 - RM600"
    links "www.google.com www.wikipedia.com"
    quantity "10+"
    user
  end

  factory :wts do
    item "Foo"
    budget "RM500 - RM600"
    links "www.google.com www.wikipedia.com"
    user
  end
end
