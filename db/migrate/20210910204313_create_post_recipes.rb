class CreatePostRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_recipes do |t|

      t.integer :user_id
      t.integer :genre_id
      t.string :title
      t.string :image_id
      t.text :ingredient
      t.text :post_introduction
      t.date :date_day
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
