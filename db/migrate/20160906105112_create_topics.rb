class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.string :location
      t.text :image_data
      t.date :deadline
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
