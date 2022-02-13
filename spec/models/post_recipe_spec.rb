require 'rails_helper'

RSpec.describe PostRecipe, type: :model do
  describe '#PostRecipe' do
    context 'タイトル、Id、調理時間、材料、作り方があるとき' do
      it "有効である" do
        post_recipe = PostRecipe.new(
        title: "title",
        user_id: "1",
        cook_time: 5,
        ingredient: "text",
        post_introduction: "text_area",
         )
         # オブジェクトをexpectに渡した時に、有効である(be valid)という意味になります
         post_recipe.valid?
         expect(post_recipe).to be_valid
      end
    end
    context 'タイトルが入力されてないとき' do
      it "無効である" do
        post_recipe = PostRecipe.new(
        title: nil,
        user_id: "1",
        cook_time: 5,
        ingredient: "text",
        post_introduction: "text_area",
        )
         post_recipe.valid?
         expect(post_recipe.errors[:title]).to include("が入力されていません。")
      end
    end
    context '材料が入力されていないとき' do
      it "無効である" do
        post_recipe = PostRecipe.new(
        title: "test",
        user_id: "1",
        cook_time: 5,
        ingredient: nil,
        post_introduction: "text_area",
        )
         post_recipe.valid?
         expect(post_recipe.errors[:ingredient]).to include("が入力されていません。")
      end
    end
    context '作り方が入力されていないとき' do
      it "無効である" do
        post_recipe = PostRecipe.new(
        title: "test",
        user_id: "1",
        cook_time: 5,
        ingredient: "text",
        post_introduction: nil,
        )
         post_recipe.valid?
         expect(post_recipe.errors[:post_introduction]).to include("が入力されていません。")
      end
    end
  end
end