puts('Seeding users...')

User.delete_all
User.create(first_name: 'Eric', last_name: 'Hermann', email: 'eric@erichermann.com', password: 'pass1234')
User.create(first_name: 'Test', last_name: 'User', email: 'test_user@test.com', password: 'pass1234')

puts("#{User.all.size} users created")


puts('Seeding recipes...')

Recipe.delete_all

recipe = Recipe.create(title: 'Recipe 1')
RecipeIngredient.create(ingredient_name: 'Recipe 1 ingredient 1', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 1 ingredient 2', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 1 ingredient 3', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 1 ingredient 4', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 1 ingredient 5', recipe: recipe)
  
RecipeStep.create(step_name: 'Recipe 1 step 1', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 1 step 2', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 1 step 3', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 1 step 4', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 1 step 5', recipe: recipe)

recipe = Recipe.create(title: 'Recipe 2')
RecipeIngredient.create(ingredient_name: 'Recipe 2 ingredient 1', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 2 ingredient 2', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 2 ingredient 3', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 2 ingredient 4', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 2 ingredient 5', recipe: recipe)
  
RecipeStep.create(step_name: 'Recipe 2 step 1', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 2 step 2', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 2 step 3', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 2 step 4', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 2 step 5', recipe: recipe)

recipe = Recipe.create(title: 'Recipe 3')
RecipeIngredient.create(ingredient_name: 'Recipe 3 ingredient 1', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 3 ingredient 2', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 3 ingredient 3', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 3 ingredient 4', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 3 ingredient 5', recipe: recipe)
  
RecipeStep.create(step_name: 'Recipe 3 step 1', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 3 step 2', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 3 step 3', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 3 step 4', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 3 step 5', recipe: recipe)

recipe = Recipe.create(title: 'Recipe 4')
RecipeIngredient.create(ingredient_name: 'Recipe 4 ingredient 1', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 4 ingredient 2', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 4 ingredient 3', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 4 ingredient 4', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 4 ingredient 5', recipe: recipe)
  
RecipeStep.create(step_name: 'Recipe 4 step 1', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 4 step 2', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 4 step 3', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 4 step 4', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 4 step 5', recipe: recipe)

recipe = Recipe.create(title: 'Recipe 5')
RecipeIngredient.create(ingredient_name: 'Recipe 5 ingredient 1', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 5 ingredient 2', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 5 ingredient 3', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 5 ingredient 4', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 5 ingredient 5', recipe: recipe)
  
RecipeStep.create(step_name: 'Recipe 5 step 1', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 5 step 2', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 5 step 3', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 5 step 4', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 5 step 5', recipe: recipe)

recipe = Recipe.create(title: 'Recipe 6')
RecipeIngredient.create(ingredient_name: 'Recipe 6 ingredient 1', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 6 ingredient 2', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 6 ingredient 3', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 6 ingredient 4', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 6 ingredient 5', recipe: recipe)
  
RecipeStep.create(step_name: 'Recipe 6 step 1', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 6 step 2', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 6 step 3', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 6 step 4', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 6 step 5', recipe: recipe)

recipe = Recipe.create(title: 'Recipe 7')
RecipeIngredient.create(ingredient_name: 'Recipe 7 ingredient 1', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 7 ingredient 2', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 7 ingredient 3', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 7 ingredient 4', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 7 ingredient 5', recipe: recipe)
  
RecipeStep.create(step_name: 'Recipe 7 step 1', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 7 step 2', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 7 step 3', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 7 step 4', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 7 step 5', recipe: recipe)

recipe = Recipe.create(title: 'Recipe 8')
RecipeIngredient.create(ingredient_name: 'Recipe 8 ingredient 1', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 8 ingredient 2', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 8 ingredient 3', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 8 ingredient 4', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 8 ingredient 5', recipe: recipe)
  
RecipeStep.create(step_name: 'Recipe 8 step 1', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 8 step 2', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 8 step 3', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 8 step 4', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 8 step 5', recipe: recipe)

recipe = Recipe.create(title: 'Recipe 9')
RecipeIngredient.create(ingredient_name: 'Recipe 9 ingredient 1', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 9 ingredient 2', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 9 ingredient 3', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 9 ingredient 4', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 9 ingredient 5', recipe: recipe)
  
RecipeStep.create(step_name: 'Recipe 9 step 1', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 9 step 2', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 9 step 3', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 9 step 4', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 9 step 5', recipe: recipe)

recipe = Recipe.create(title: 'Recipe 10')
RecipeIngredient.create(ingredient_name: 'Recipe 10 ingredient 1', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 10 ingredient 2', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 10 ingredient 3', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 10 ingredient 4', recipe: recipe)
RecipeIngredient.create(ingredient_name: 'Recipe 10 ingredient 5', recipe: recipe)

RecipeStep.create(step_name: 'Recipe 10 step 1', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 10 step 2', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 10 step 3', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 10 step 4', recipe: recipe)
RecipeStep.create(step_name: 'Recipe 10 step 5', recipe: recipe)


puts("#{Recipe.all.size} recipies created")


