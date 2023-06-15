class CreateDrinkComments < ActiveRecord::Migration[6.1]
  def change
    create_table :drink_comments do |t|
      #会員ID
      t.integer :customer_id, null: false
      #ドリンクID
      t.integer :drink_id, null: false
      #コメント
      t.text :comment
      t.timestamps
    end
  end
end
