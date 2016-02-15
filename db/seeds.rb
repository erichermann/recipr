puts('Seeding users...')

User.delete_all
User.create(first_name: 'Eric', last_name: 'Hermann',
            email: 'eric@erichermann.com', password: 'pass1234')
User.create(first_name: 'Test', last_name: 'User',
            email: 'test_user@test.com', password: 'pass1234')

puts("#{User.all.size} users created")

puts('Seeding recipes...')

Recipe.delete_all
RecipeStep.delete_all
RecipeIngredient.delete_all
(1..10).each do |i|
  recipe = Recipe.create(title: "Recipe #{i}")
  (1..5).each do |j|
    ingredient_name = "#{recipe.title} ingredient #{j}"
    RecipeIngredient.create(ingredient_name: ingredient_name, recipe: recipe)
    RecipeStep.create(step_name: "#{recipe.title} step #{j}", recipe: recipe)
  end
end

puts("#{Recipe.all.size} recipies created")
