require 'rails_helper'

def clear_recipes_from_db
  Recipe.delete_all
  RecipeStep.delete_all
  RecipeIngredient.delete_all
end

def seed_test_data
  clear_recipes_from_db

  (1..10).each do |i|
    recipe = Recipe.create(title: "Recipe #{i}")
    (1..5).each do |j|
      ingredient_name = "#{recipe.title} ingredient #{j}"
      RecipeIngredient.create(ingredient_name: ingredient_name, recipe: recipe)
      RecipeStep.create(step_name: "#{recipe.title} step #{j}", recipe: recipe)
    end
  end
end

describe 'search page' do
  it 'search should return results', js: true do
    seed_test_data
    visit '/'
    within('#search_form') do
      fill_in 'search', with: 'recipe'
      click_button('search')
    end

    within('#recipr_contents') do
      page.should have_content('Displaying recipes 1 - 5 of 10 in total')
    end
  end
end
