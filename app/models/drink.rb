class Drink < ApplicationRecord

  has_one_attached :image
  belongs_to :customer
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :introduction, presence: true, length: { maximum: 255 }

  def favorited?(customer)
   favorites.where(customer_id: customer.id).exists?
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @drink = Drink.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @drink = Drink.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @drink = Drink.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @drink = Drink.where("name LIKE?","%#{word}%")
    else
      @drink = Drink.all
    end
  end
end
