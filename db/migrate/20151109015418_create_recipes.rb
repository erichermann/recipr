class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes, force: true do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :publication_date
      t.timestamps
    end

    add_index :recipes, :title
    add_index :recipes, :author
  end
end


