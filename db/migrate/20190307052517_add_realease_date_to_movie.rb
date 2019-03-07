class AddRealeaseDateToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :release_date, :date
    add_column :movies, :duration, :time
  end
end
