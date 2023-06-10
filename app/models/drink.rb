class Drink < ApplicationRecord

  has_one_attached :image
  belongs_to :customers
  has_many :favorites

end
