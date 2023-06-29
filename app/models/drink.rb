class Drink < ApplicationRecord

  has_one_attached :image
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :drink_comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :introduction, presence: true, length: { maximum: 255 }

# ソート機能
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count, -> {order(star: :desc)}

  #いいね機能
  def favorited?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  #ドリンク検索時
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
