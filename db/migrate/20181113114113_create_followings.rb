class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.belongs_to :user
      t.integer :following_user_id
      t.timestamps null: false
    end
  end
end
