class Drink < ApplicationRecord

  has_one_attached :image
  belongs_to :customer
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :introduction, presence: true, length: { maximum: 255 }

  def favorited?(customer)
   favorites.where(customer_id: customer.id).exists?
  end
end
