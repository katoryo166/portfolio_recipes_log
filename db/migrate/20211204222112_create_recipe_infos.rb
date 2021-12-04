class CreateRecipeInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_infos do |t|
      t.references :post_recipe, foreign_key: true
      t.string :ing_name
      t.string :quantity

      t.timestamps
    end
  end
end
