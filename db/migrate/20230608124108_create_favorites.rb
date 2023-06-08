class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      #会員のID
      t.integer :customer_id
      #ドリンクのID
      t.integer :drink_id
      t.timestamps
    end
  end
end
