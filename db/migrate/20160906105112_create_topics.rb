class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :wikipedia
      t.string :image
      t.date :deadline
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
