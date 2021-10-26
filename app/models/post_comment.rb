class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post_recipe

  validates :comment, presence:true, length:{minimum:1,maximim:20}
end
