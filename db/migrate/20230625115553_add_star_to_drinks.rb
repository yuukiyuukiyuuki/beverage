class AddStarToDrinks < ActiveRecord::Migration[6.1]
  def change
    add_column :drinks, :star, :string
  end
end
