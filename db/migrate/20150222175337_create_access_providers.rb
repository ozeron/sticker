class CreateAccessProviders < ActiveRecord::Migration
  def change
    create_table :access_providers do |t|
      t.string :code
      t.string :access_token, index: true
      t.string :refresh_token
      t.string :access_token_expires_at
      t.integer :user_id, index: true
      t.timestamps null: false
    end
  end
end
