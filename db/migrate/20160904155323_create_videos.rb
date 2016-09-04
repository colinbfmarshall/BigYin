class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :video_data
      t.integer :topic_id

      t.boolean :processed, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
