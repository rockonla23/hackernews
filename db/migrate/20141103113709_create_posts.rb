class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject
      t.string :url
      t.string :user_id

      t.timestamp
    end
  end
end
