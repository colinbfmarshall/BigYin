class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :nationality
      t.string :location
      t.string :occupation
      t.string :gender
      t.boolean :famous, default: false
      t.string :marital_status
      t.boolean :share

      t.timestamps null: false
    end
  end
end
