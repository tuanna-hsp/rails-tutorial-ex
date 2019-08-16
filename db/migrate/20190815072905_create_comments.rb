class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :micropost_id
      t.integer :user_id
      t.string :content

      t.timestamps
    end
    add_index :comments, :micropost_id
  end
end
