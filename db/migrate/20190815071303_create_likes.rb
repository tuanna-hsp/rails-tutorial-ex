class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :micropost_id
      t.integer :user_id

      t.timestamps
    end
    add_index :likes, %i[micropost_id user_id], unique: true
  end
end
