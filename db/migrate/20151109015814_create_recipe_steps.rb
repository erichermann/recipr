class CreateRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipe_steps, force: true do |t|
      t.string :step_name
      t.integer :step_number
      t.integer :recipe_id
      t.timestamps
    end

    add_index :recipe_steps, :step_name
  end
end


