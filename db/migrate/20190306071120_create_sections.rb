class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :section_name
      t.integer :seats
      t.integer :price
      t.references :screen, foreign_key: true

      t.timestamps
    end
  end
end
