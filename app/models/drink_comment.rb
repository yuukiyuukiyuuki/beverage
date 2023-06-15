class DrinkComment < ApplicationRecord
  belongs_to :customer
  belongs_to :drink
end
