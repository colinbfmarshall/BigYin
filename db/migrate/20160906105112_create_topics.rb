class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :wikipedia
      t.date :deadline
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
