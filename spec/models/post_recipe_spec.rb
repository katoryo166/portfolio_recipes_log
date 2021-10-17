require 'rails_helper'

RSpec.describe PostRecipe, type: :model do
  describe '#PostRecipe' do
    context 'タイトル、Id、材料、があるとき' do
      it "有効である" do
        post_recipe = PostRecipe.new(
        title: "title",
        user_id: "1",
        ingredient: "text",
        post_introduction: "text_area",
         )
         # オブジェクトをexpectに渡した時に、有効である(be valid)という意味になります
         post_recipe.valid?
         expect(post_recipe).to be_valid
      end
    end
    context '名前がないとき' do
      it "無効である" do
        post_recipe = PostRecipe.new(
        title: nil,
        user_id: "1",
        ingredient: "text",
        post_introduction: "text_area",
        )
         post_recipe.valid?
         expect(post_recipe.errors[:title]).to include("が入力されていません。")
      end
    end
  end
end