class CreateWallPosts < ActiveRecord::Migration
  def change
    create_table :wall_posts do |t|
      t.integer :owner_id
      t.integer :from_id
      t.date :date
      t.text :text

      t.timestamps null: false
    end
  end
end
