class PostRecipe < ApplicationRecord


  belongs_to :user
  belongs_to :genre
  attachment :image

  validates :title, presence:true, length:{minimum:2,maximim:20}
  validates :ingredient, presence:true, length:{ maximum: 100}
  validates :post_introduction, presence:true, length:{ maximum: 200}

end
