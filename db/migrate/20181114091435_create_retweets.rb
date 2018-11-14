class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.belongs_to :user
      t.belongs_to :tweet
      t.timestamps null: false
    end
  end
end
