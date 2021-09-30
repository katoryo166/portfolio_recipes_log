class PostRecipe < ApplicationRecord


  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(keyword)
    if keyword
      post_recipe = PostRecipe.joins(:user,:genre)
      post_recipe.where(["title like? OR post_introduction like?", "%#{keyword}%",
      "%#{keyword}%"]).or(post_recipe.where("users.name like?", "%#{keyword}%")).or(post_recipe.where("genres.name like?", "%#{keyword}%"))
    else
      @post_recipes = PostRecipe.page(params[:page]).reverse_order
    end
  end


  attachment :image

  validates :title, presence:true, length:{minimum:2,maximim:20}
  validates :ingredient, presence:true, length:{ maximum: 100}
  validates :post_introduction, presence:true, length:{ maximum: 200}

end
