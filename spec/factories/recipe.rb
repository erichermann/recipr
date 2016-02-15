# Recipe factory
FactoryGirl.define do
  factory :recipe do
    title 'Recipe 1'
    author 'Recipe author'
    description 'Recipe 1 description'
    publication_date Time.now
    created_at Time.now
    updated_at Time.now
  end
end
