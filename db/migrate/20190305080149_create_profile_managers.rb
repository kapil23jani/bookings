class CreateProfileManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_managers do |t|
      t.string :name
      t.integer :gender
      t.string :address
      t.string :experience
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
