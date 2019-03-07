class CreateMovieshows < ActiveRecord::Migration[5.2]
  def change
    create_table :movieshows do |t|
      t.date :show_date
      t.time :show_time
      t.references :movie, foreign_key: true
      t.references :theatre, foreign_key: true
      t.references :screen, foreign_key: true

      t.timestamps
    end
  end
end
