class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|

      #フォローする会員のID
      t.integer :follower_id
      #フォロワーする会員ID
      t.integer :followed_id
      t.timestamps
    end
  end
end
