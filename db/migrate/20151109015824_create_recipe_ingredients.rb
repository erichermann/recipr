class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients, force: true do |t|
      t.string :ingredient_name
      t.integer :ingredient_number
      t.integer :recipe_id
      t.timestamps
    end
    
    add_index :recipe_ingredients, :ingredient_name
  end
end
