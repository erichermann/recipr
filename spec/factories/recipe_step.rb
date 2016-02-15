FactoryGirl.define do
  factory :recipe_step do
    sequence(:step_name, 100) { |n| "Recipe #{n}, step #{n}" }
    created_at Time.now
    updated_at Time.now
  end
end
