class AddCookTimeToPostRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :post_recipes, :cook_time, :integer
  end
end
