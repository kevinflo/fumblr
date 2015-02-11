FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobarbar"
    password_confirmation "foobarbar"
    confirmed_at DateTime.now
  end

  factory :post do
    title "MyString"
    content "MyText"
    user
  end
  
  # factory :relationship do
  #   follower_id 1
  #   followed_id 2
  # end
end