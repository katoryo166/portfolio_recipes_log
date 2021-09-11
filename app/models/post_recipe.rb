class PostRecipe < ApplicationRecord


  belongs_to :user
  attachment :image

end
