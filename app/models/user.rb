class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :post_recipes, dependent: :destroy
  has_many :post_comment, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :account_image

  validates :name, presence: true,  length: { minimum: 2, maximum:20}
  validates :introduction, length: { maximum: 50}


  def full_name
    name
  end

end
