class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.date :dob
      t.text :bio
      t.references :user
      t.timestamps null: false
    end
  end
end
