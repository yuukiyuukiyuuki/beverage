class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      #会員ID
      t.integer :customer_id
      #ドリンク名
      t.string :name
      #ドリンクの説明
      t.text :introduction
      #コメント
      t.text :comment
      t.timestamps
    end
  end
end
