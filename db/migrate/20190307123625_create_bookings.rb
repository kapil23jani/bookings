class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :price
      t.string :seats
      t.references :movieshow, foreign_key: true
      t. references :user

      t.timestamps
    end
  end
end
