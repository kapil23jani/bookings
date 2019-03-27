class CreateJoinTableMovieCast < ActiveRecord::Migration[5.2]
  def change
    create_join_table :movies, :casts do |t|
       #t.index [:movie_id, :cast_id]
      t.index [:cast_id, :movie_id]
    end
  end
end
