class CreateScreens < ActiveRecord::Migration[5.2]
  def change
    create_table :screens do |t|
      t.string :name
      t.references :theatre, foreign_key: true

      t.timestamps
    end
  end
end
