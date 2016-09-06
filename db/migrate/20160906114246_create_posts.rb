class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.boolean :live, default: false
      t.boolean :share, default: false

      t.timestamps null: false
    end
  end
end
