class Drink < ApplicationRecord

  has_one_attached :image
  belongs_to :customer
  has_many :favorites

  validates :name, presence: true, length: { maximum: 50 }
  validates :introduction, presence: true, length: { maximum: 255 }
end
