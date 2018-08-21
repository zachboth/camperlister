FactoryBot.define do
  factory :photo do
    title "MyString"
    image_data "MyText"
  end
  factory :user do
    sequence(:email) { |e| "#{e}@example.com" }
    password "password"
    admin false
  end

  factory :listing do
    association :user
  end
end
