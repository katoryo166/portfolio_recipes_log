class Genre < ApplicationRecord

  has_many :post_recipes
  
  validates :name, presence:true

end
