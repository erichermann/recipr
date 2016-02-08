FactoryGirl.define do
  factory :user do
    first_name 'Fake'
    last_name 'User'
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password 'helloworld'
    password_confirmation 'helloworld'
    created_at Time.now
  end
end
