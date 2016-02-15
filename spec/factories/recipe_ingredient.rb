FactoryGirl.define do
  factory :recipe_ingredient do
    sequence(:ingredient_name, 100) { |n| "Recipe #{n}, ingredient #{n} name" }
    created_at Time.now
    updated_at Time.now
  end
end
