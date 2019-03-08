class CreateTheatres < ActiveRecord::Migration[5.2]
  def change
    create_table :theatres do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :facilities
      t.references :user

      t.timestamps
    end
  end
end
