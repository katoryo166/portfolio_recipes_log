class PostRecipe < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recipe_infos, dependent: :destroy
  has_many :how_to_makes, dependent: :destroy
  accepts_nested_attributes_for :recipe_infos, :how_to_makes, allow_destroy: true

  def favorited_by?(current_user)
     favorites.where(user_id: current_user.id).exists?
  end

  #投稿一覧検索
  def self.search(keyword)
    if keyword
      post_recipe = PostRecipe.joins(:user,:genre)
      post_recipe.where(["title like? OR cook_time like? OR ingredient like? OR post_introduction like?", "%#{keyword}%","%#{keyword}%",
      "%#{keyword}%","%#{keyword}%"]).or(post_recipe.where("users.name like?", "%#{keyword}%")).or(post_recipe.where("genres.name like?", "%#{keyword}%"))
    else
      @post_recipes = PostRecipe.page(params[:page]).reverse_order
    end
  end

  def self.retrieval(keyword)
    if keyword
      post_recipe = PostRecipe.joins(:user,:genre)
      post_recipe.where(["title like? OR cook_time like? OR ingredient like? OR post_introduction like?", "%#{keyword}%","%#{keyword}%",
      "%#{keyword}%","%#{keyword}%"]).or(post_recipe.where("users.name like?", "%#{keyword}%")).or(post_recipe.where("genres.name like?", "%#{keyword}%"))
    else
      @post_recipes = PostRecipe.all
    end
  end

  attachment :image

  validates :title, presence:true, length:{minimum:2,maximim:20}
  validates :ingredient, presence:true, length:{ maximum: 100}
  validates :post_introduction, presence:true, length:{ maximum: 200}
  validates :cook_time, numericality: { only_integer: true }

end
