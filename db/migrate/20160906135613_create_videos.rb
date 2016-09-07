class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :video_data
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.boolean :processed, default: false

      t.timestamps null: false
    end
  end
end
